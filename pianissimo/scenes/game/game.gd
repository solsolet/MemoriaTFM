extends Control

const NOTE_SCENE = preload("res://scenes/note/note.tscn")
const NOTE_HEIGHT = 36.0
const SAVE_PATH = "user://piano_idle_save.cfg"

@onready var notes_label: Label = $SafeAreaContainer/VBoxContainer/NotesLabel
@onready var game_area: Control = $SafeAreaContainer/VBoxContainer/GameArea
@onready var hit_line: ColorRect = $SafeAreaContainer/VBoxContainer/GameArea/HitLine
@onready var key_buttons: Array[Button] = [
	$SafeAreaContainer/VBoxContainer/GameArea/KeyRow/Key0,
	$SafeAreaContainer/VBoxContainer/GameArea/KeyRow/Key1,
	$SafeAreaContainer/VBoxContainer/GameArea/KeyRow/Key2,
]

@onready var auto_tap_button: Button = $SafeAreaContainer/VBoxContainer/UpgradePanel/VBoxContainer/AutoTapRow/AutoTapButton
@onready var auto_tap_label: Label = $SafeAreaContainer/VBoxContainer/UpgradePanel/VBoxContainer/AutoTapRow/AutoTapLabel
@onready var multiplier_button: Button = $SafeAreaContainer/VBoxContainer/UpgradePanel/VBoxContainer/MultiplierRow/MultiplierButton
@onready var multiplier_label: Label = $SafeAreaContainer/VBoxContainer/UpgradePanel/VBoxContainer/MultiplierRow/MultiplierLabel

var notes_value: int = 0
var active_notes: Array[Note] = []
var spawn_timer: Timer
var auto_tap_timer: Timer

var note_speed: float = 220.0
var auto_tap_level: int = 0
var multiplier_level: int = 0

func _ready() -> void:
	notes_label.text = "Notes: 0"

	_setup_timers()

	# Load progress from disk before updating the UI.
	load_progress()

	update_upgrade_labels()

	_apply_ui_scaling()
	get_viewport().size_changed.connect(_apply_ui_scaling)


func _apply_ui_scaling() -> void:
	var viewport_height = max(1.0, get_viewport().size.y)
	var font_size = int(clamp(viewport_height * 0.028, 18, 34))

	notes_label.add_theme_font_size_override("font_size", int(font_size * 1.4))
	auto_tap_label.add_theme_font_size_override("font_size", font_size)
	multiplier_label.add_theme_font_size_override("font_size", font_size)
	auto_tap_button.add_theme_font_size_override("font_size", font_size)
	multiplier_button.add_theme_font_size_override("font_size", font_size)


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_PAUSED, NOTIFICATION_APPLICATION_FOCUS_OUT:
			save_progress()

		NOTIFICATION_APPLICATION_RESUMED, NOTIFICATION_APPLICATION_FOCUS_IN:
			load_progress()


# INFO: Persistencia
func save_progress() -> void:
	var config = ConfigFile.new()

	config.set_value("player", "notes", notes_value)
	config.set_value("player", "auto_tap_level", auto_tap_level)
	config.set_value("player", "multiplier_level", multiplier_level)
	config.set_value("player", "last_save_time", int(Time.get_unix_time_from_system()))

	var err = config.save(SAVE_PATH)
	if err != OK:
		print("Could not save progress: ", err)

func load_progress() -> void:
	var config = ConfigFile.new()

	if not FileAccess.file_exists(SAVE_PATH):
		return

	var err = config.load(SAVE_PATH)
	if err != OK:
		print("Could not load progress: ", err)
		return

	notes_value = int(config.get_value("player", "notes", 0))
	auto_tap_level = int(config.get_value("player", "auto_tap_level", 0))
	multiplier_level = int(config.get_value("player", "multiplier_level", 0))

	var last_save_time = int(config.get_value("player", "last_save_time", int(Time.get_unix_time_from_system())))
	var now = int(Time.get_unix_time_from_system())
	var elapsed_seconds = max(0, now - last_save_time)

	if elapsed_seconds > 0:
		# Simple offline income formula.
		var offline_rate = 1.0 + auto_tap_level * 0.5
		var offline_gain = int(elapsed_seconds * offline_rate)

		if offline_gain > 0:
			notes_value += offline_gain
			print("Offline gain: ", offline_gain)

	notes_label.text = "Notes: %d" % notes_value
	update_upgrade_labels()

	# Save again so the last_save_time is refreshed after loading.
	save_progress()


func _setup_timers() -> void:
	# Periodically spawn new notes.
	spawn_timer = Timer.new()
	spawn_timer.wait_time = 0.8
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(spawn_timer)

	# Auto-tap notes near the hit line.
	auto_tap_timer = Timer.new()
	auto_tap_timer.wait_time = 1.0
	auto_tap_timer.autostart = true
	auto_tap_timer.timeout.connect(_on_auto_tap_timeout)
	add_child(auto_tap_timer)

func _on_spawn_timer_timeout() -> void:
	# Spawn a note in a random lane.
	var lane = randi_range(0, key_buttons.size() - 1)
	spawn_note(lane)

func spawn_note(lane_index: int) -> void:
	# Create a note and match its width to the key width.
	var key_button = key_buttons[lane_index]
	var note = NOTE_SCENE.instantiate() as Note
	note.lane = lane_index
	note.speed = note_speed

	var note_width = max(1.0, key_button.size.x)
	var note_height = max(32.0, key_button.size.y * 0.35)
	note.set_note_size(Vector2(note_width, note_height))

	# Position it relative to the game area.
	var key_rect = key_button.get_global_rect()
	var game_rect = game_area.get_global_rect()

	var x_position = key_rect.position.x - game_rect.position.x
	x_position += key_button.size.x * 0.5 - note.size.x * 0.5

	note.position = Vector2(x_position, -note.size.y)
	game_area.add_child(note)
	active_notes.append(note)

func _process(delta: float) -> void:
	# Move notes downward and remove them once they hit the line.
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
	# Try to hit the closest note in the requested lane.
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
	# Multiply the reward with the current multiplier level.
	var reward = amount * (1 + multiplier_level)
	notes_value += reward
	notes_label.text = "Notes: %d" % notes_value

	save_progress()


func _on_auto_tap_timeout() -> void:
	# Auto-tap only if the player already bought the upgrade.
	if auto_tap_level <= 0:
		return

	var best_note = _find_closest_note()
	if best_note == null:
		return

	award_notes(1)
	active_notes.erase(best_note)
	best_note.queue_free()

func _on_auto_tap_button_pressed() -> void:
	var cost = auto_tap_cost()
	if notes_value < cost:
		return

	notes_value -= cost
	auto_tap_level += 1

	# Faster auto-tap as the level grows.
	auto_tap_timer.wait_time = max(0.4, 1.0 - 0.1 * auto_tap_level)
	update_upgrade_labels()

	save_progress()


func _on_multiplier_button_pressed() -> void:
	var cost = multiplier_cost()
	if notes_value < cost:
		return

	notes_value -= cost
	multiplier_level += 1
	update_upgrade_labels()

	save_progress()

func auto_tap_cost() -> int:
	return 10 + auto_tap_level * 8

func multiplier_cost() -> int:
	return 15 + multiplier_level * 12

func update_upgrade_labels() -> void:
	auto_tap_label.text = "Auto Tap Lv %d  Cost: %d" % [auto_tap_level, auto_tap_cost()]
	multiplier_label.text = "Multiplier Lv %d  Cost: %d" % [multiplier_level, multiplier_cost()]
	notes_label.text = "Notes: %d" % notes_value


func cleanup() -> void:
	# Stop timers and clear notes when leaving the scene.
	save_progress()

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
