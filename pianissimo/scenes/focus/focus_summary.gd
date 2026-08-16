extends Control

@onready var result_label: Label = $SafeArea/VBoxContainer/ResultLabel
@onready var detail_label: Label = $SafeArea/VBoxContainer/DetailLabel
@onready var continue_button: Button = $SafeArea/VBoxContainer/ContinueButton


func _ready() -> void:
	if FocusManager.last_completed:
		result_label.text = "Session completed"
		detail_label.text = "You earned %d notes." % FocusManager.last_reward
	else:
		result_label.text = "Session failed"
		detail_label.text = "You left the app before finishing."
	continue_button.pressed.connect(_on_continue_pressed)


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file(ScenePaths.HOME)
