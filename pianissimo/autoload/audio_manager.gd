extends Node

const SFX_DIR := "res://assets/sound/sfx/"
const MUSIC_DIR := "res://assets/sound/music/"
const MUSIC_BUS := "Music"
const SFX_BUS := "SFX"
const SFX_POOL_SIZE := 8

var _sfx_players: Array[AudioStreamPlayer] = []
var _sfx_cache: Dictionary = {}  # file_name -> AudioStream
var music_player: AudioStreamPlayer

const LANE_NOTE_MAP := {
	0: "c4.wav",
	1: "c#4.wav",
	2: "d4.wav",
	3: "d#4.wav", # TODO: Afegir noves tecles
	4: "e4.wav",
	5: "f4.wav",
	6: "f#4.wav",
	7: "g4.wav",
}


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


func _ensure_bus(bus_name: String) -> void:
	if AudioServer.get_bus_index(bus_name) != -1:
		return
	AudioServer.add_bus()
	var idx := AudioServer.bus_count - 1
	AudioServer.set_bus_name(idx, bus_name)
	AudioServer.set_bus_send(idx, "Master")


func play_note_hit(lane: int) -> void:
	var file_name: String = LANE_NOTE_MAP.get(lane, "c4.wav")
	_play_sfx(file_name)


func play_ui_click() -> void:
	_play_sfx("click1.wav")


func play_music(file_name: String, loop: bool = true) -> void:
	var path := MUSIC_DIR + file_name
	if not ResourceLoader.exists(path):
		return
	var stream: AudioStream = ResourceLoader.load(path)
	if stream is AudioStreamOggVorbis:
		stream.loop = loop
	music_player.stream = stream
	music_player.play()


func stop_music() -> void:
	music_player.stop()


func set_sfx_volume_linear(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(clamp(value, 0.0001, 1.0)))


func set_music_volume_linear(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(clamp(value, 0.0001, 1.0)))


func _play_sfx(file_name: String) -> void:
	var stream := _load_sfx(file_name)
	if stream == null:
		return
	var player := _get_free_sfx_player()
	player.stream = stream
	player.play()


func _load_sfx(file_name: String) -> AudioStream:
	if _sfx_cache.has(file_name):
		return _sfx_cache[file_name]
	var path := SFX_DIR + file_name
	if not ResourceLoader.exists(path):
		return null
	var stream: AudioStream = ResourceLoader.load(path)
	_sfx_cache[file_name] = stream
	return stream


func _get_free_sfx_player() -> AudioStreamPlayer:
	for p in _sfx_players:
		if not p.playing:
			return p
	return _sfx_players[0]  # pool exhausted (8 overlapping hits) -- steal the oldest
