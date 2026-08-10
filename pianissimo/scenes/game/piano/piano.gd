extends Control
class_name Piano

signal note_scored(lane: int, accuracy: String)

const NOTE_SCENE = preload("res://scenes/note/note.tscn")
const BLACK_LANE := 1 # lane 1 renders as a black key; generalize later if lane_count grows

@export var note_speed: float = 220.0

@onready var hit_line: ColorRect = $HitLine
@onready var key_row: Control = $KeyRow
@onready var notes_layer: Control = $NotesLayer

var key_buttons: Array[Button] = []
var spawn_timer: Timer
var auto_tap_timer: Timer


func _ready() -> void:
	_collect_keys()
	call_deferred("_layout_keys") # sizes aren't final until after the first layout pass
	key_row.resized.connect(_layout_keys)
	
	_setup_timers()
	UpgradeManager.upgrade_purchased.connect(_on_upgrade_purchased)


func _collect_keys() -> void:
	key_buttons.clear()
	for child in key_row.get_children():
		if child is Button:
			key_buttons.append(child)
	key_buttons.sort_custom(func(a, b): return a.name < b.name)
	
	for i in key_buttons.size():
		key_buttons[i].pressed.connect(handle_key_input.bind(i))


func _layout_keys() -> void:
	var width := key_row.size.x
	var height := key_row.size.y
	
	var white_keys: Array[Button] = []
	var black_key: Button = null
	for i in key_buttons.size():
		if i == BLACK_LANE:
			black_key = key_buttons[i]
		else:
			white_keys.append(key_buttons[i])
	
	if white_keys.is_empty():
		return
	
	var white_width := width / float(white_keys.size())
	for i in white_keys.size():
		white_keys[i].position = Vector2(i * white_width, 0)
		white_keys[i].size = Vector2(white_width, height)
	
	if black_key != null:
		var black_width := white_width * 0.5
		var black_height := height * 0.6
		black_key.position = Vector2(white_width - black_width * 0.5, 0)
		black_key.size = Vector2(black_width, black_height)
		black_key.move_to_front()  # draw on top of the white keys it overlaps


func _setup_timers() -> void:
	spawn_timer = Timer.new()
	spawn_timer.wait_time = 0.8
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(spawn_timer)

	auto_tap_timer = Timer.new()
	auto_tap_timer.wait_time = 1.0
	auto_tap_timer.autostart = true
	auto_tap_timer.timeout.connect(_on_auto_tap_timeout)
	add_child(auto_tap_timer)


func _on_spawn_timer_timeout() -> void:
	var lane = randi_range(0, key_buttons.size() - 1)
	spawn_note(lane)


func spawn_note(lane_index: int) -> void:
	var key_button := key_buttons[lane_index]
	var note := NOTE_SCENE.instantiate() as Note
	note.lane = lane_index
	note.speed = note_speed
	note.miss_y = hit_line.position.y
	note.missed.connect(_on_note_missed)

	var note_width = max(1.0, key_button.size.x)
	var note_height = max(32.0, key_button.size.y * 0.35)
	note.set_note_size(Vector2(note_width, note_height))

	var key_rect = key_button.get_global_rect()
	var layer_rect = notes_layer.get_global_rect()
	var x_position = key_rect.position.x - layer_rect.position.x
	x_position += key_button.size.x * 0.5 - note.size.x * 0.5

	note.position = Vector2(x_position, -note.size.y)
	notes_layer.add_child(note)


func _on_note_missed(_note: Note) -> void:
	pass  # no penalty yet -- placeholder for a future miss-streak mechanic


func handle_key_input(lane_index: int) -> void:
	var best_note := _find_best_note_for_lane(lane_index)
	if best_note == null:
		return

	var distance = abs((best_note.position.y + best_note.size.y) - hit_line.position.y)
	var accuracy := ""
	AudioManager.play_note_hit(lane_index)
	
	if distance <= 20.0:
		accuracy = "perfect"
	elif distance <= 50.0:
		accuracy = "good"
	else:
		return

	# Disconnect first: queue_free() is deferred, so this note could still run
	# one more _process() this frame and fire "missed" right after we scored it.
	best_note.missed.disconnect(_on_note_missed)
	best_note.queue_free()
	note_scored.emit(lane_index, accuracy)


func _find_notes_in_lane(lane_index: int) -> Array[Note]:
	var result: Array[Note] = []
	for child in notes_layer.get_children():
		if child is Note and child.lane == lane_index:
			result.append(child)
	return result


func _find_best_note_for_lane(lane_index: int) -> Note:
	var best_note: Note = null
	var best_distance := INF
	for note in _find_notes_in_lane(lane_index):
		var distance = abs((note.position.y + note.size.y) - hit_line.position.y)
		if distance < best_distance:
			best_distance = distance
			best_note = note
	return best_note


func _find_closest_note() -> Note:
	var closest_note: Note = null
	var closest_distance := INF
	for child in notes_layer.get_children():
		if child is Note:
			var distance = abs((child.position.y + child.size.y) - hit_line.position.y)
			if distance < closest_distance and distance <= 90.0:
				closest_distance = distance
				closest_note = child
	return closest_note


func _on_auto_tap_timeout() -> void:
	if UpgradeManager.get_level("auto_tap") <= 0:
		return
	var best_note := _find_closest_note()
	if best_note == null:
		return

	var lane := best_note.lane
	AudioManager.play_note_hit(lane)
	best_note.missed.disconnect(_on_note_missed)
	best_note.queue_free()
	note_scored.emit(lane, "auto")


func _on_upgrade_purchased(id: String, new_level: int) -> void:
	if id == "auto_tap":
		auto_tap_timer.wait_time = max(0.4, 1.0 - 0.1 * new_level)


func cleanup() -> void:
	if spawn_timer:
		spawn_timer.stop()
		spawn_timer.queue_free()
		spawn_timer = null
	if auto_tap_timer:
		auto_tap_timer.stop()
		auto_tap_timer.queue_free()
		auto_tap_timer = null
	for child in notes_layer.get_children():
		child.queue_free()


func _exit_tree() -> void:
	cleanup()
