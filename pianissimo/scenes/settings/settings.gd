extends Control

@export var music_slider: HSlider
@export var sfx_slider: HSlider
@export var music_mute_button: CheckButton
@export var sfx_mute_button: CheckButton
@export var reset_button: Button
@export var reset_confirm_dialog: ConfirmationDialog


func _ready() -> void:
	music_slider.value = SettingsManager.music_volume
	sfx_slider.value = SettingsManager.sfx_volume
	music_mute_button.button_pressed = SettingsManager.music_muted
	sfx_mute_button.button_pressed = SettingsManager.sfx_muted
	
	music_slider.value_changed.connect(_on_music_changed)
	sfx_slider.value_changed.connect(_on_sfx_changed)
	music_mute_button.toggled.connect(func(p): SettingsManager.music_muted = p; SettingsManager.save_settings())
	sfx_mute_button.toggled.connect(func(p): SettingsManager.sfx_muted = p; SettingsManager.save_settings())
	
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
