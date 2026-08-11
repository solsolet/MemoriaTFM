extends Node
## User preferences: ConfigFile

const SETTINGS_PATH := "user://settings.cfg"

var music_volume: float = 0.8:
	set(value):
		music_volume = clamp(value, 0.0, 1.0)
		AudioManager.set_music_volume_linear(music_volume)

var sfx_volume: float = 0.8:
	set(value):
		sfx_volume = clamp(value, 0.0, 1.0)
		AudioManager.set_sfx_volume_linear(sfx_volume)

func _ready() -> void:
	call_deferred("load_settings")


func load_settings() -> void:
	var config := ConfigFile.new()
	if config.load(SETTINGS_PATH) == OK:
		music_volume = float(config.get_value("audio", "music_volume", 0.8))
		sfx_volume = float(config.get_value("audio", "sfx_volume", 0.8))
	else:
		# No file yet
		music_volume = music_volume
		sfx_volume = sfx_volume


func save_settings() -> void:
	var config := ConfigFile.new()
	config.set_value("audio", "music_volume", music_volume)
	config.set_value("audio", "sfx_volume", sfx_volume)
	config.save(SETTINGS_PATH)
