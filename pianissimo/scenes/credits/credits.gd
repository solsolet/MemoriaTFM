extends Control


func _ready() -> void:
	AudioManager.ensure_playlist_playing(["menu1.mp3"])

func _on_back_button_pressed() -> void:
	AudioManager.play_ui_click()
	get_tree().call_deferred("change_scene_to_file",ScenePaths.SETTINGS)
