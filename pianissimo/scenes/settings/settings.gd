extends Control

@export var music_slider: HSlider
@export var sfx_slider: HSlider
@export var reset_button: Button
@export var reset_confirm_dialog: ConfirmationDialog


func _ready() -> void:
	music_slider.value = SettingsManager.music_volume
	sfx_slider.value = SettingsManager.sfx_volume
	music_slider.value_changed.connect(_on_music_changed)
	sfx_slider.value_changed.connect(_on_sfx_changed)
	reset_button.pressed.connect(func(): reset_confirm_dialog.popup_centered())
	reset_confirm_dialog.confirmed.connect(_on_reset_confirmed)


func _on_music_changed(value: float) -> void:
	SettingsManager.music_volume = value
	SettingsManager.save_settings()


func _on_sfx_changed(value: float) -> void:
	SettingsManager.sfx_volume = value
	SettingsManager.save_settings()
	AudioManager.play_note_hit(0)


func _on_reset_confirmed() -> void:
	SaveManager.reset_data()
	get_tree().change_scene_to_file(ScenePaths.HOME)


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(SettingsManager.return_scene_path)
