extends Control

const NOTE_SCENE = preload("res://scenes/note/note.tscn")
const NOTE_HEIGHT = 36.0


@export var notes_label: Label
@export var piano: Piano

var active_notes: Array[Note] = []
var spawn_timer: Timer
var auto_tap_timer: Timer

var note_speed: float = 220.0


func _ready() -> void:
	Economy.notes_changed.connect(_on_notes_changed)
	_on_notes_changed(Economy.notes)
	
	piano.note_scored.connect(_on_note_scored)
	
	_apply_offline_income()

	_apply_ui_scaling()
	get_viewport().size_changed.connect(_apply_ui_scaling)
	
	AudioManager.play_music("bg_music_01.ogg")


# INFO: UI
func _apply_ui_scaling() -> void:
	var viewport_height = max(1.0, get_viewport().size.y)
	var font_size = int(clamp(viewport_height * 0.028, 18, 34))

	notes_label.add_theme_font_size_override("font_size", int(font_size * 1.4))


# INFO: Notifications
func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_PAUSED, NOTIFICATION_APPLICATION_FOCUS_OUT:
			SaveManager.save_data()
		NOTIFICATION_APPLICATION_RESUMED, NOTIFICATION_APPLICATION_FOCUS_IN:
			_apply_offline_income()
			SaveManager.save_data()


func _on_upgrade_purchased(id: String, new_level: int) -> void:
	if id == "auto_tap":
		auto_tap_timer.wait_time = max(0.4, 1.0 - 0.1 * new_level)


func _apply_offline_income() -> void:
	var now = int(Time.get_unix_time_from_system())
	var elapsed = max(0, now - SaveManager.data.last_save_time)
	if elapsed <= 0:
		return
	
	var offline_rate = 1.0 + UpgradeManager.get_level("auto_tap") * 0.5
	var offline_gain = int(elapsed * offline_rate)
	if offline_gain > 0:
		Economy.add(offline_gain)
		print("Offline gain: ", offline_gain)


func _on_notes_changed(value: int) -> void:
	notes_label.text = "Notes: %d " % value


func _on_note_scored(_lane: int, accuracy: String) -> void:
	var base_amount := 1
	if accuracy == "perfect":
		base_amount = 2
	var reward = base_amount * (1 + UpgradeManager.get_level("multiplier"))
	Economy.add(reward)


# Stop timers and clear notes when leaving the scene
func cleanup() -> void:
	if piano:
		piano.cleanup()
	SaveManager.save_data()


func _exit_tree() -> void:
	cleanup()


func _on_btn_back_pressed() -> void:
	cleanup()
	get_tree().change_scene_to_file("res://scenes/home/home.tscn")
