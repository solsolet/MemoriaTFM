extends Control


func _on_idle_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")


func _on_focus_button_pressed() -> void:
	print("Focus mode coming soon")


func _on_settings_button_pressed() -> void:
	print("Settings coming soon")


func _on_achievments_button_pressed() -> void:
	print("Achievements coming soon")
