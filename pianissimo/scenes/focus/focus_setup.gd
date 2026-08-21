extends Control

@export var title_field: LineEdit
@export var description_field: TextEdit
@export var duration_spinbox: SpinBox
@export var start_button: Button
@export var journal_button: Button
@export var back_button: Button


func _ready() -> void:
	start_button.pressed.connect(_on_start_pressed)
	journal_button.pressed.connect(_on_journal_pressed)
	back_button.pressed.connect(_on_back_pressed)


func _on_start_pressed() -> void:
	var title = title_field.text.strip_edges() # erase special char (\n...)
	if title == "":
		title = "Practise session"
	var target_seconds = int(duration_spinbox.value) * 60
	
	FocusManager.start_session(title, description_field.text.strip_edges(), target_seconds)
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_SESSION)


func _on_journal_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_JOURNAL)


func _on_back_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.HOME)
