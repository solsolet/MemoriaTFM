extends Control
class_name NoteField

const NOTE_SCENE = preload("res://scenes/note/note.tscn")
const PRECISION_BASE_PERFECT := 20.0
const PRECISION_BASE_GOOD := 50.0
const PRECISION_PER_LEVEL := 4.0

@export var note_speed: float = 220.0

var hit_line_y: float = 0.0


func spawn_note(lane_index: int, key_rect: Rect2) -> void:
	var note := NOTE_SCENE.instantiate() as Note
	note.lane = lane_index
	note.speed = note_speed
	note.miss_y = hit_line_y
	note.missed.connect(_on_note_missed)

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

	#var distance = abs((best_note.position.y + best_note.size.y) - hit_line_y)
	#var accuracy := ""
	#if distance <= _perfect_threshold():
		#accuracy = "perfect"
	#elif distance <= _good_threshold():
		#accuracy = "good"
	#else:
		#return ""
	var offset = (best_note.position.y + best_note.size.y) - hit_line_y  # negative = early, positive = late
	var accuracy := ""
	if offset >= -6.0 and offset <= _perfect_threshold():
		accuracy = "perfect"
	elif offset >= -20.0 and offset <= _good_threshold():
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
	return PRECISION_BASE_PERFECT + StatManager.get_level("precision") * PRECISION_PER_LEVEL

func _good_threshold() -> float:
	return PRECISION_BASE_GOOD + StatManager.get_level("precision") * (PRECISION_PER_LEVEL * 1.5)

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
