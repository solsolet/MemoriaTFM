extends Control

@export var title_field: LineEdit
@export var description_field: TextEdit
@export var duration_spinbox: SpinBox
@export var mode_checkbutton : CheckButton
@export var tag_field: LineEdit
@export var tag_presets_row: HBoxContainer
@export var start_button: Button
@export var journal_button: Button
@export var back_button: Button

var _selected_tag_color: Color = Color.TRANSPARENT


func _ready() -> void:
	AudioManager.ensure_playlist_playing(["menu1.mp3"])
	
	start_button.pressed.connect(_on_start_pressed)
	journal_button.pressed.connect(_on_journal_pressed)
	back_button.pressed.connect(_on_back_pressed)
	
	for child in tag_presets_row.get_children():
		if child is Button:
			child.pressed.connect(_on_preset_tag_pressed.bind(child))
	tag_field.text_changed.connect(_on_tag_field_edited)


# INFO: Tags
func _on_preset_tag_pressed(button: Button) -> void:
	tag_field.text = button.text
	_selected_tag_color = button.get_theme_color("icon_normal_color")

func _on_tag_field_edited(_new_text: String) -> void:
	_selected_tag_color = Color.TRANSPARENT


func _on_start_pressed() -> void:
	var title = title_field.text.strip_edges() # erase special char (\n...)
	if title == "":
		title = "Practise session"
	var target_seconds = int(duration_spinbox.value) * 60
	
	var mode: FocusManager.Mode = FocusManager.Mode.PERMISSIVE if mode_checkbutton.button_pressed else FocusManager.Mode.STRICT
	FocusManager.start_session(title, description_field.text.strip_edges(), target_seconds, tag_field.text.strip_edges(), _selected_tag_color, mode)
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_SESSION)


func _on_journal_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_JOURNAL)


func _on_back_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.HOME)
