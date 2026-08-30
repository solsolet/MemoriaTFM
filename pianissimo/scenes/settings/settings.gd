extends Control

const TUTORIAL_OVERLAY_SCENE = preload("res://scenes/tutorial/tutorial_overlay.tscn")

@export var music_slider: HSlider
@export var sfx_slider: HSlider
@export var music_mute_button: CheckButton
@export var sfx_mute_button: CheckButton
@export var reminder_hours_field: SpinBox
@export var reminders_enabled_toggle: CheckButton
@export var reset_button: Button
@export var reset_confirm_dialog: ConfirmationDialog
@export var game_tutorial_button: Button
@export var practise_tutorial_button: Button


func _ready() -> void:
	AudioManager.ensure_playlist_playing(["menu1.mp3"])
	
	music_slider.value = SettingsManager.music_volume
	sfx_slider.value = SettingsManager.sfx_volume
	music_mute_button.button_pressed = SettingsManager.music_muted
	sfx_mute_button.button_pressed = SettingsManager.sfx_muted
	
	music_slider.value_changed.connect(_on_music_changed)
	sfx_slider.value_changed.connect(_on_sfx_changed)
	music_mute_button.toggled.connect(func(p): SettingsManager.music_muted = p; SettingsManager.save_settings())
	sfx_mute_button.toggled.connect(func(p): SettingsManager.sfx_muted = p; SettingsManager.save_settings())
	
	reminder_hours_field.value = SettingsManager.reminder_hours
	reminders_enabled_toggle.button_pressed = SettingsManager.reminders_enabled
	reminder_hours_field.value_changed.connect(func(v):
		SettingsManager.reminder_hours = v
		SettingsManager.save_settings())
	reminders_enabled_toggle.toggled.connect(func(p):
		SettingsManager.reminders_enabled = p
		SettingsManager.save_settings()
		if not p:
			NotificationManager.cancel_daily_reminder())
	
	reset_button.pressed.connect(func(): reset_confirm_dialog.popup_centered())
	reset_confirm_dialog.confirmed.connect(_on_reset_confirmed)
	game_tutorial_button.pressed.connect(_on_replay_game_tutorial_pressed)
	practise_tutorial_button.pressed.connect(_on_replay_practise_tutorial_pressed)


func _on_music_changed(value: float) -> void:
	SettingsManager.music_volume = value
	SettingsManager.save_settings()


func _on_sfx_changed(value: float) -> void:
	SettingsManager.sfx_volume = value
	SettingsManager.save_settings()
	AudioManager.play_note_hit(0)


func _on_reset_confirmed() -> void:
	SaveManager.reset_data()
	get_tree().call_deferred("change_scene_to_file",ScenePaths.HOME)


func _on_replay_game_tutorial_pressed() -> void:
	var overlay := TUTORIAL_OVERLAY_SCENE.instantiate() as TutorialOverlay
	add_child(overlay)
	overlay.setup("game_intro")

func _on_replay_practise_tutorial_pressed() -> void:
	var overlay := TUTORIAL_OVERLAY_SCENE.instantiate() as TutorialOverlay
	add_child(overlay)
	overlay.setup("focus_intro")


func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",SettingsManager.return_scene_path)
