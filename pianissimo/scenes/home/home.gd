extends Control

@export var achievements_button: Button


func _ready() -> void:
	achievements_button.pressed.connect(_on_achievements_button_pressed)


func _on_idle_button_pressed() -> void:
	get_tree().change_scene_to_file(ScenePaths.GAME)

func _on_focus_button_pressed() -> void:
	get_tree().change_scene_to_file(ScenePaths.FOCUS_SETUP)

func _on_settings_button_pressed() -> void:
	SettingsManager.return_scene_path = ScenePaths.HOME
	get_tree().change_scene_to_file(ScenePaths.SETTINGS)

func _on_achievements_button_pressed() -> void:
	AchievementManager.show_achievements_ui()

func _on_album_button_pressed() -> void:
	get_tree().change_scene_to_file(ScenePaths.CARD_ALBUM)
