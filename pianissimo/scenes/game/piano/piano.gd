extends Control
class_name Piano

signal note_scored(lane: int, accuracy: String)

const BASE_SPAWN_INTERVAL := 0.8
const MIN_SPAWN_INTERVAL := 0.25
const VELOCITY_SPEEDUP_PER_LEVEL := 0.93

@onready var hit_line: ColorRect = $HitLine
@onready var keyboard: PianoKeyboard = $KeyRow
@onready var note_field: NoteField = $NotesLayer

var spawn_timer: Timer
var auto_tap_timer: Timer


func _ready() -> void:
	keyboard.key_pressed.connect(_on_key_pressed)
	keyboard.layout_changed.connect(_update_hit_line)
	UpgradeManager.upgrade_purchased.connect(_on_upgrade_purchased)
	StatManager.stat_purchased.connect(_on_stat_purchased)

	_setup_timers()
	_apply_velocity()
	_update_hit_line()


func _update_hit_line() -> void:
	hit_line.position = Vector2(0, keyboard.position.y)
	hit_line.size.x = keyboard.size.x
	note_field.hit_line_y = hit_line.position.y


func _setup_timers() -> void:
	spawn_timer = Timer.new()
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(spawn_timer)

	auto_tap_timer = Timer.new()
	auto_tap_timer.wait_time = 1.0
	auto_tap_timer.autostart = true
	auto_tap_timer.timeout.connect(_on_auto_tap_timeout)
	add_child(auto_tap_timer)


func _apply_velocity() -> void:
	var level := StatManager.get_level("velocity")
	var interval = BASE_SPAWN_INTERVAL * pow(VELOCITY_SPEEDUP_PER_LEVEL, level)
	spawn_timer.wait_time = max(MIN_SPAWN_INTERVAL, interval)


func _on_spawn_timer_timeout() -> void:
	var lane = randi_range(0, keyboard.key_buttons.size() - 1)
	note_field.spawn_note(lane, keyboard.get_key_rect(lane))


func _on_key_pressed(lane_index: int) -> void:
	var accuracy := note_field.try_hit_lane(lane_index)
	if accuracy == "":
		return
	AudioManager.play_note_hit(lane_index)
	note_scored.emit(lane_index, accuracy)


func _on_auto_tap_timeout() -> void:
	if UpgradeManager.get_level("auto_tap") <= 0:
		return
	var result := note_field.try_auto_hit()
	if result.is_empty():
		return
	note_scored.emit(result["lane"], result["accuracy"])


func _on_upgrade_purchased(id: String, new_level: int) -> void:
	if id == "auto_tap":
		auto_tap_timer.wait_time = max(0.4, 1.0 - 0.1 * new_level)


func _on_stat_purchased(id: String, _new_level: int) -> void:
	if id == "velocity":
		_apply_velocity()


func cleanup() -> void:
	if spawn_timer:
		spawn_timer.stop()
	if auto_tap_timer:
		auto_tap_timer.stop()
	note_field.cleanup()


func _exit_tree() -> void:
	cleanup()
