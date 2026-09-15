extends Control

const CANCEL_WINDOW := 10.0

@export var title_label: Label
@export var time_label: Label
@export var progress_bar: ProgressBar
@export var cancel_button: Button
@export var music_button: CheckButton

var _music_on: bool = false


func _ready() -> void:
	AudioManager.stop_music()
	
	title_label.text = FocusManager.title
	FocusManager.session_completed.connect(_on_completed)
	FocusManager.session_failed.connect(_on_failed)
	FocusManager.session_cancelled.connect(_on_cancelled)
	cancel_button.pressed.connect(func(): AudioManager.play_ui_click(); FocusManager.cancel_session())
	music_button.pressed.connect(_on_music_toggle_pressed)


func _process(_delta: float) -> void:
	if not FocusManager.is_active:
		return
	var remaining = max(0, FocusManager.target_seconds - FocusManager.elapsed_seconds)
	time_label.text = _format_time(remaining)
	progress_bar.value = (FocusManager.elapsed_seconds / float(FocusManager.target_seconds)) * 100.0
	
	var remaining_cancel = CANCEL_WINDOW - FocusManager.elapsed_seconds
	cancel_button.visible = remaining_cancel > 0
	if remaining_cancel > 0:
		cancel_button.text = "Cancel (%d)" % int(ceil(remaining_cancel))


func _format_time(seconds: float) -> String:
	var total := int(seconds)
	#@warning_ignore("integer_division")
	return "%02d:%02d" % [total / 60, total % 60]


func _on_music_toggle_pressed() -> void:
	_music_on = not _music_on
	if _music_on:
		AudioManager.ensure_playlist_playing(["Fugue No.2 Cm.mp3"])
	else:
		AudioManager.stop_music()


func _on_completed(_reward: int) -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_SUMMARY)

func _on_failed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_SUMMARY)

func _on_cancelled() -> void:
	get_tree().call_deferred("change_scene_to_file", ScenePaths.FOCUS_SETUP)
