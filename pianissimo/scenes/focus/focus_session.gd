extends Control

@onready var title_label: Label = $SafeArea/VBoxContainer/TitleLabel
@onready var time_label: Label = $SafeArea/VBoxContainer/TimeLabel
@onready var progress_bar: ProgressBar = $SafeArea/VBoxContainer/ProgressBar


func _ready() -> void:
	title_label.text = FocusManager.title
	FocusManager.session_completed.connect(_on_completed)
	FocusManager.session_failed.connect(_on_failed)


func _process(_delta: float) -> void:
	if not FocusManager.is_active:
		return
	var remaining = max(0, FocusManager.target_seconds - FocusManager.elapsed_seconds)
	time_label.text = _format_time(remaining)
	progress_bar.value = (FocusManager.elapsed_seconds / float(FocusManager.target_seconds)) * 100.0


func _format_time(seconds: float) -> String:
	var total := int(seconds)
	#@warning_ignore("integer_division")
	return "%02d:%02d" % [total / 60, total % 60]


func _on_completed(_reward: int) -> void:
	get_tree().change_scene_to_file(ScenePaths.FOCUS_SUMMARY)


func _on_failed() -> void:
	get_tree().change_scene_to_file(ScenePaths.FOCUS_SUMMARY)
