extends Control
class_name NoteField

const NOTE_SCENE = preload("res://scenes/note/note.tscn")
const PRECISION_BASE_PERFECT := 20.0
const PRECISION_BASE_GOOD := 50.0
const PRECISION_PER_LEVEL := 4.0

const EARLY_PERFECT_LIMIT := -125.0
const EARLY_GOOD_LIMIT := -200.0

@export var note_speed: float = 220.0
@export var good_zone: ColorRect
@export var perfect_zone: ColorRect

var hit_line_y: float = 0.0:
	set(value):
		hit_line_y = value
		call_deferred("_update_target_zone")


func _ready() -> void:
	StatManager.stat_purchased.connect(_on_stat_purchased)


func _on_stat_purchased(id: String, _new_level: int) -> void:
	if id == "precision":
		_update_target_zone()


func _update_target_zone() -> void:
	if good_zone == null or perfect_zone == null:
		return
	good_zone.position.y = hit_line_y + EARLY_GOOD_LIMIT
	good_zone.size.y = _good_threshold() - EARLY_GOOD_LIMIT
	perfect_zone.position.y = hit_line_y + EARLY_PERFECT_LIMIT
	perfect_zone.size.y = _perfect_threshold() - EARLY_PERFECT_LIMIT


func spawn_note(lane_index: int, key_rect: Rect2, golden: bool = false) -> void:
	var note := NOTE_SCENE.instantiate() as Note
	note.lane = lane_index
	note.is_golden = golden
	note.speed = note_speed
	note.miss_y = hit_line_y
	note.missed.connect(_on_note_missed)
	if golden:
		note.modulate = Color("FFD34D")

	var note_width = max(1.0, key_rect.size.x)
	var note_height = max(32.0, key_rect.size.y * 0.35)
	note.set_note_size(Vector2(note_width, note_height))

	var layer_rect = get_global_rect()
	var x_position = key_rect.position.x - layer_rect.position.x
	x_position += key_rect.size.x * 0.5 - note.size.x * 0.5

	note.position = Vector2(x_position, -note.size.y)
	add_child(note)


func try_hit_lane(lane_index: int) -> String:
	var best_note := _find_best_note_for_lane(lane_index)
	if best_note == null:
		return ""
	
	var offset = (best_note.position.y + best_note.size.y) - hit_line_y  # negative = early, positive = late
	
	if best_note.is_golden:
		if offset >= EARLY_GOOD_LIMIT and offset <= _good_threshold():
			best_note.missed.disconnect(_on_note_missed)
			best_note.queue_free()
			return "golden"
		return ""
		
	var accuracy := ""
	if offset >= EARLY_PERFECT_LIMIT and offset <= _perfect_threshold():
		accuracy = "perfect"
	elif offset >= EARLY_GOOD_LIMIT and offset <= _good_threshold():
		accuracy = "good"
	else:
		return ""

	best_note.missed.disconnect(_on_note_missed)
	best_note.queue_free()
	return accuracy


func try_auto_hit() -> Dictionary:
	var best_note := _find_closest_note()
	if best_note == null:
		return {}
	var lane := best_note.lane
	best_note.missed.disconnect(_on_note_missed)
	best_note.queue_free()
	return {"lane": lane, "accuracy": "auto"}


func cleanup() -> void:
	for child in get_children():
		child.queue_free()


func _perfect_threshold() -> float:
	return PRECISION_BASE_PERFECT + StatManager.get_level("precision") * PRECISION_PER_LEVEL + UpgradeManager.get_level("metronome") * 2.0

func _good_threshold() -> float:
	return PRECISION_BASE_GOOD + StatManager.get_level("precision") * (PRECISION_PER_LEVEL * 1.5) + UpgradeManager.get_level("metronome") * 3.0

func _on_note_missed(_note: Note) -> void:
	pass


func _find_notes_in_lane(lane_index: int) -> Array[Note]:
	var result: Array[Note] = []
	for child in get_children():
		if child is Note and child.lane == lane_index:
			result.append(child)
	return result


func _find_best_note_for_lane(lane_index: int) -> Note:
	var best_note: Note = null
	var best_distance := INF
	for note in _find_notes_in_lane(lane_index):
		var distance = abs((note.position.y + note.size.y) - hit_line_y)
		if distance < best_distance:
			best_distance = distance
			best_note = note
	return best_note


func _find_closest_note() -> Note:
	var closest_note: Note = null
	var closest_distance := INF
	for child in get_children():
		if child is Note:
			var distance = abs((child.position.y + child.size.y) - hit_line_y)
			if distance < closest_distance and distance <= 90.0:
				closest_distance = distance
				closest_note = child
	return closest_note
