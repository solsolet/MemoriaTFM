extends Control

const NOTE_SCENE = preload("res://scenes/note/note.tscn")
const NOTE_HEIGHT = 36.0


@export var notes_label: Label
@export var game_area: Control
@export var hit_line: ColorRect
@export var key_buttons: Array[Button] = []

var active_notes: Array[Note] = []
var spawn_timer: Timer
var auto_tap_timer: Timer

var note_speed: float = 220.0


func _ready() -> void:
	Economy.notes_changed.connect(_on_notes_changed)
	_on_notes_changed(Economy.notes)
	
	UpgradeManager.upgrade_purchased.connect(_on_upgrade_purchased)
	
	_apply_offline_income()
	_setup_timers()

	_apply_ui_scaling()
	get_viewport().size_changed.connect(_apply_ui_scaling)


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


func _setup_timers() -> void:
	# Periodically spawn new notes
	spawn_timer = Timer.new()
	spawn_timer.wait_time = 0.8
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(spawn_timer)

	# Auto-tap notes near the hit line
	auto_tap_timer = Timer.new()
	auto_tap_timer.wait_time = 1.0
	auto_tap_timer.autostart = true
	auto_tap_timer.timeout.connect(_on_auto_tap_timeout)
	add_child(auto_tap_timer)


func _on_spawn_timer_timeout() -> void:
	# Spawn a note in a random lane
	var lane = randi_range(0, key_buttons.size() - 1)
	spawn_note(lane)


func spawn_note(lane_index: int) -> void:
	var key_button = key_buttons[lane_index]
	var note = NOTE_SCENE.instantiate() as Note
	note.lane = lane_index
	note.speed = note_speed

	var note_width = max(1.0, key_button.size.x)
	var note_height = max(32.0, key_button.size.y * 0.35)
	note.set_note_size(Vector2(note_width, note_height))

	# Position it relative to the game area
	var key_rect = key_button.get_global_rect()
	var game_rect = game_area.get_global_rect()

	var x_position = key_rect.position.x - game_rect.position.x
	x_position += key_button.size.x * 0.5 - note.size.x * 0.5

	note.position = Vector2(x_position, -note.size.y)
	game_area.add_child(note)
	active_notes.append(note)


func _process(delta: float) -> void:
	# Move notes downward and remove them once they hit the line
	for i in range(active_notes.size() - 1, -1, -1):
		var note = active_notes[i]
		note.position.y += note.speed * delta

		if _note_reached_hit_line(note):
			active_notes.remove_at(i)
			note.queue_free()


func _note_reached_hit_line(note: Note) -> bool:
	var note_bottom = note.position.y + note.size.y
	return note_bottom >= hit_line.position.y


func _on_key_0_pressed() -> void:
	handle_key_input(0)


func _on_key_1_pressed() -> void:
	handle_key_input(1)


func _on_key_2_pressed() -> void:
	handle_key_input(2)


func handle_key_input(lane_index: int) -> void:
	# Try to hit the closest note in the requested lane
	var best_note = _find_best_note_for_lane(lane_index)
	if best_note == null:
		return

	var distance = abs((best_note.position.y + best_note.size.y) - hit_line.position.y)

	if distance <= 20.0:
		award_notes(2)
	elif distance <= 50.0:
		award_notes(1)
	else:
		return

	active_notes.erase(best_note)
	best_note.queue_free()


func _find_best_note_for_lane(lane_index: int) -> Note:
	var best_note: Note = null
	var best_distance: float = INF

	for note in active_notes:
		if note.lane != lane_index:
			continue
		var distance = abs((note.position.y + note.size.y) - hit_line.position.y)
		if distance < best_distance:
			best_distance = distance
			best_note = note

	return best_note


func _find_closest_note() -> Note:
	# Used by auto-tap to find the note closest to the hit line.
	var closest_note: Note = null
	var closest_distance: float = INF

	for note in active_notes:
		var distance = abs((note.position.y + note.size.y) - hit_line.position.y)
		if distance < closest_distance and distance <= 90.0:
			closest_distance = distance
			closest_note = note

	return closest_note


func award_notes(amount: int) -> void:
	var reward = amount * (1 + UpgradeManager.get_level("multiplier"))
	Economy.add(reward)


func _on_auto_tap_timeout() -> void:
	# Auto-tap only if the player already bought the upgrade
	if UpgradeManager.get_level("auto_tap") <= 0:
		return

	var best_note = _find_closest_note()
	if best_note == null:
		return

	award_notes(1)
	active_notes.erase(best_note)
	best_note.queue_free()


# Stop timers and clear notes when leaving the scene
func cleanup() -> void:
	SaveManager.save_data()
	set_process(false)

	if spawn_timer:
		spawn_timer.stop()
		spawn_timer.queue_free()
		spawn_timer = null

	if auto_tap_timer:
		auto_tap_timer.stop()
		auto_tap_timer.queue_free()
		auto_tap_timer = null

	for note in active_notes:
		note.queue_free()
	active_notes.clear()


func _exit_tree() -> void:
	cleanup()


func _on_btn_back_pressed() -> void:
	cleanup()
	get_tree().change_scene_to_file("res://scenes/home/home.tscn")
