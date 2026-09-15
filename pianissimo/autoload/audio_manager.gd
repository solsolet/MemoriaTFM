extends Node

const SFX_DIR := "res://assets/sound/sfx/"
const PIANO_KEYS_DIR := SFX_DIR + "piano_keys/"
const MUSIC_DIR := "res://assets/sound/music/"
const MUSIC_BUS := "Music"
const SFX_BUS := "SFX"
const SFX_POOL_SIZE := 8
const LANE_NOTE_MAP := {
	0: "c4.wav",
	1: "c#4.wav",
	2: "d4.wav",
	3: "d#4.wav",
	4: "e4.wav",
	5: "f4.wav",
	6: "f#4.wav",
	7: "g4.wav",
	8: "g#4.wav",
	9: "a4.wav",
	10: "a#4.wav",
	11: "b4.wav",
}

var _sfx_players: Array[AudioStreamPlayer] = []
var _sfx_cache: Dictionary = {}  # file_name -> AudioStream
var music_player: AudioStreamPlayer

var _playlist: Array[String] = []
var _playlist_index: int = 0


func _ready() -> void:
	_ensure_bus(MUSIC_BUS)
	_ensure_bus(SFX_BUS)
	
	for i in SFX_POOL_SIZE:
		var p := AudioStreamPlayer.new()
		p.bus = SFX_BUS
		add_child(p)
		_sfx_players.append(p)

	music_player = AudioStreamPlayer.new()
	music_player.bus = MUSIC_BUS
	add_child(music_player)
	
	music_player.finished.connect(_on_music_finished)


func _ensure_bus(bus_name: String) -> void:
	if AudioServer.get_bus_index(bus_name) != -1:
		return
	AudioServer.add_bus()
	var idx := AudioServer.bus_count - 1
	AudioServer.set_bus_name(idx, bus_name)
	AudioServer.set_bus_send(idx, "Master")


func ensure_playlist_playing(file_names: Array[String]) -> void:
	#print("ensure_playlist_playing called with: ", file_names, " | current _playlist: ", _playlist, " | music_player.playing: ", music_player.playing)
	if music_player.playing and _playlist == file_names:
		#print("  -> already playing this playlist, skipping")
		return
	_playlist = file_names.duplicate()
	_playlist_index = 0
	_play_current_track()


func play_note_hit(lane: int) -> void:
	var file_name: String = LANE_NOTE_MAP.get(lane, "c4.wav")
	_play_sfx(file_name, PIANO_KEYS_DIR)


func play_ui_click() -> void:
	_play_sfx("click1.wav")


func _play_current_track() -> void:
	if _playlist.is_empty():
		#print("  -> playlist is empty, nothing to play")
		return
	var path := MUSIC_DIR + _playlist[_playlist_index]
	#print("  -> trying to play: ", path, " | exists: ", ResourceLoader.exists(path))
	if not ResourceLoader.exists(path):
		return
	music_player.stream = ResourceLoader.load(path)
	music_player.play()


func _on_music_finished() -> void:
	if _playlist.is_empty():
		return
	_playlist_index = (_playlist_index + 1) % _playlist.size()
	_play_current_track()


func stop_music() -> void:
	_playlist.clear()
	music_player.stop()


func set_sfx_volume_linear(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(clamp(value, 0.0001, 1.0)))


func set_music_volume_linear(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(clamp(value, 0.0001, 1.0)))


func _play_sfx(file_name: String, directory: String = SFX_DIR) -> void:
	var stream := _load_sfx(file_name, directory)
	if stream == null:
		return
	var player := _get_free_sfx_player()
	player.stream = stream
	player.play()


func _load_sfx(file_name: String, directory: String = SFX_DIR) -> AudioStream:
	var cache_key := directory + file_name
	
	if _sfx_cache.has(cache_key):
		return _sfx_cache[cache_key]
	
	var path := directory + file_name
	if not ResourceLoader.exists(path):
		return null
	
	var stream: AudioStream = ResourceLoader.load(path)
	_sfx_cache[cache_key] = stream
	return stream


func _get_free_sfx_player() -> AudioStreamPlayer:
	for p in _sfx_players:
		if not p.playing:
			return p
	return _sfx_players[0]  # pool exhausted (8 overlapping hits) -- steal the oldest
