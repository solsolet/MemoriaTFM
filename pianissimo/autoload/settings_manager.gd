extends Node

const SETTINGS_PATH := "user://settings.cfg"

var return_scene_path: String = ScenePaths.HOME
# Notification plugin
var reminder_hours: float = 24.0
var reminders_enabled: bool = true

var music_volume: float = 0.8:
	set(value):
		music_volume = clamp(value, 0.0, 1.0)
		_apply_music_volume()

var sfx_volume: float = 0.8:
	set(value):
		sfx_volume = clamp(value, 0.0, 1.0)
		_apply_sfx_volume()

var music_muted: bool = false:
	set(value):
		music_muted = value
		_apply_music_volume()

var sfx_muted: bool = false:
	set(value):
		sfx_muted = value
		_apply_sfx_volume()


func _ready() -> void:
	call_deferred("load_settings")


# INFO: Guardar/Carregar
func load_settings() -> void:
	var config := ConfigFile.new()
	if config.load(SETTINGS_PATH) == OK:
		music_volume = float(config.get_value("audio", "music_volume", 0.8))
		sfx_volume = float(config.get_value("audio", "sfx_volume", 0.8))
		music_muted = bool(config.get_value("audio", "music_muted", false))
		sfx_muted = bool(config.get_value("audio", "sfx_muted", false))
		reminder_hours = float(config.get_value("notifications", "reminder_hours", 24.0))
		reminders_enabled = bool(config.get_value("notifications", "reminders_enabled", true))
	else:
		music_volume = music_volume
		sfx_volume = sfx_volume
		music_muted = music_muted
		sfx_muted = sfx_muted


func save_settings() -> void:
	var config := ConfigFile.new()
	config.set_value("audio", "music_volume", music_volume)
	config.set_value("audio", "sfx_volume", sfx_volume)
	config.get_value("audio", "music_muted", false)
	config.get_value("audio", "sfx_muted", false)
	config.set_value("notifications", "reminder_hours", reminder_hours)
	config.set_value("notifications", "reminders_enabled", reminders_enabled)
	config.save(SETTINGS_PATH)


# INFO: Configuració so
func _apply_music_volume() -> void:
	AudioManager.set_music_volume_linear(0.0 if music_muted else music_volume)


func _apply_sfx_volume() -> void:
	AudioManager.set_sfx_volume_linear(0.0 if sfx_muted else sfx_volume)
