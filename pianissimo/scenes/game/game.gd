extends Control

const NOTE_SCENE = preload("res://scenes/note/note.tscn")

@onready var notes_label: Label = $VBoxContainer/NotesLabel
@onready var game_area: Control = $VBoxContainer/GameArea
@onready var hit_line: ColorRect = $VBoxContainer/GameArea/HitLine
@onready var key_buttons: Array[Button] = [
	$VBoxContainer/GameArea/KeyRow/Key0,
	$VBoxContainer/GameArea/KeyRow/Key1,
	$VBoxContainer/GameArea/KeyRow/Key2,
]

var notes_value: int = 0
var active_notes: Array[Note] = []
var spawn_timer: Timer

func _ready() -> void:
	notes_label.text = "Notes: 0"

	spawn_timer = Timer.new()
	spawn_timer.wait_time = 0.8
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(spawn_timer)

func _on_spawn_timer_timeout() -> void:
	var lane = randi() % key_buttons.size()
	spawn_note(lane)

func spawn_note(lane_index: int) -> void:
	var note = NOTE_SCENE.instantiate() as Note
	note.lane = lane_index

	var key_button = key_buttons[lane_index]
	var note_width = 80
	var note_height = 24

	note.size = Vector2(note_width, note_height)

	var x_position = key_button.position.x + (key_button.size.x * 0.5) - (note.size.x * 0.5)
	note.position = Vector2(x_position, -note.size.y)

	game_area.add_child(note)
	active_notes.append(note)

func _process(delta: float) -> void:
	for i in range(active_notes.size() - 1, -1, -1):
		var note = active_notes[i]

		note.position.y += note.speed * delta

		if note.position.y >= hit_line.position.y - note.size.y:
			active_notes.remove_at(i)
			note.queue_free()

func _on_key_0_pressed() -> void:
	handle_key_input(0)

func _on_key_1_pressed() -> void:
	handle_key_input(1)

func _on_key_2_pressed() -> void:
	handle_key_input(2)

func handle_key_input(lane_index: int) -> void:
	var best_note: Note = null
	var best_distance: float = INF

	for note in active_notes:
		if note.lane != lane_index:
			continue

		var distance = abs(note.position.y - hit_line.position.y)
		if distance < best_distance:
			best_distance = distance
			best_note = note

	if best_note == null:
		return

	if best_distance <= 40.0:
		notes_value += 2
		notes_label.text = "Notes: %d" % notes_value
	elif best_distance <= 90.0:
		notes_value += 1
		notes_label.text = "Notes: %d" % notes_value

	active_notes.erase(best_note)
	best_note.queue_free()

func _on_btn_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home/Home.tscn")
