extends Control

@onready var notes_label: Label = $VBoxContainer/NotesLabel

func _ready() -> void:
	notes_label.text = "Notes: 0"

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home/home.tscn")
