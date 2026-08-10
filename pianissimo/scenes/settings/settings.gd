extends Control

@onready var music_slider: HSlider = $VBoxContainer/MusicSlider
@onready var sfx_slider: HSlider = $VBoxContainer/SfxSlider


func _ready() -> void:
	music_slider.value = SettingsManager.music_volume
	sfx_slider.value = SettingsManager.sfx_volume
	music_slider.value_changed.connect(_on_music_changed)
	sfx_slider.value_changed.connect(_on_sfx_changed)


func _on_music_changed(value: float) -> void:
	SettingsManager.music_volume = value
	SettingsManager.save_settings()


func _on_sfx_changed(value: float) -> void:
	SettingsManager.sfx_volume = value
	SettingsManager.save_settings()
	AudioManager.play_note_hit(0)


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home/home.tscn")
