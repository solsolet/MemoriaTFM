extends Node

const SFX_DIR := "res://assets/sound/sfx/"
const MUSIC_DIR := "res://assets/sound/music/"
const SFX_POOL_SIZE := 8

## click1: https://freesound.org/s/751232/
## click2: https://freesound.org/s/250552/
## pop: https://freesound.org/s/665183/
## ding: https://freesound.org/s/204648/
## bach1: https://musopen.org/music/43466-the-well-tempered-clavier-book-i-bwv-846-869/

var _sfx_players: Array[AudioStreamPlayer] = []
var _sfx_cache: Dictionary = {}  # file_name -> AudioStream
var music_player: AudioStreamPlayer

const LANE_NOTE_MAP := {
	0: "c4.wav",
	1: "c4#.wav",
	2: "d4.wav",
}


func _ready() -> void:
	for i in SFX_POOL_SIZE:
		var p := AudioStreamPlayer.new()
		p.bus = "SFX"
		add_child(p)
		_sfx_players.append(p)

	music_player = AudioStreamPlayer.new()
	music_player.bus = "Music"
	add_child(music_player)


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
