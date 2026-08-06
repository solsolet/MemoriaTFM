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

@onready var auto_tap_button: Button = $VBoxContainer/UpgradePanel/VBoxContainer/AutoTapRow/AutoTapButton
@onready var auto_tap_label: Label = $VBoxContainer/UpgradePanel/VBoxContainer/AutoTapRow/AutoTapLabel
@onready var multiplier_button: Button = $VBoxContainer/UpgradePanel/VBoxContainer/MultiplierRow/MultiplierButton
@onready var multiplier_label: Label = $VBoxContainer/UpgradePanel/VBoxContainer/MultiplierRow/MultiplierLabel

var notes_value: int = 0
var active_notes: Array[Note] = []
var spawn_timer: Timer
var auto_tap_timer: Timer

var note_speed: float = 220.0
var note_width: float = 80.0
var note_height: float = 24.0

var auto_tap_level: int = 0
var multiplier_level: int = 0

func _ready() -> void:
	notes_label.text = "Notes: 0"

	hit_line.size.y = 12
	hit_line.size_flags_horizontal = Control.SIZE_FILL

	update_upgrade_labels()

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
	var note = NOTE_SCENE.instantiate() as Note
	note.lane = lane_index
	note.speed = note_speed

	note.size = Vector2(note_width, note_height)

	var key_button = key_buttons[lane_index]
	var key_rect = key_button.get_global_rect()
	var game_rect = game_area.get_global_rect()

	var x_position = key_rect.position.x - game_rect.position.x
	x_position += key_button.size.x * 0.5 - note.size.x * 0.5

	note.position = Vector2(x_position, -note.size.y)
	game_area.add_child(note)
	active_notes.append(note)

func _process(delta: float) -> void:
	for i in range(active_notes.size() - 1, -1, -1):
		var note = active_notes[i]
		note.position.y += note.speed * delta

		var note_bottom = note.position.y + note.size.y
		var hit_y = hit_line.position.y

		if note_bottom >= hit_y:
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

		var distance = abs((note.position.y + note.size.y) - hit_line.position.y)
		if distance < best_distance:
			best_distance = distance
			best_note = note

	if best_note == null:
		return

	if best_distance <= 20.0:
		award_notes(2)
	elif best_distance <= 50.0:
		award_notes(1)
	else:
		return

	active_notes.erase(best_note)
	best_note.queue_free()

func award_notes(amount: int) -> void:
	var reward = amount * (1 + multiplier_level)
	notes_value += reward
	notes_label.text = "Notes: %d" % notes_value

func _on_auto_tap_timeout() -> void:
	if auto_tap_level <= 0:
		return

	if active_notes.is_empty():
		return

	var closest_note: Note = null
	var closest_distance: float = INF

	for note in active_notes:
		var distance = abs((note.position.y + note.size.y) - hit_line.position.y)
		if distance < closest_distance:
			closest_distance = distance
			closest_note = note

	if closest_note == null:
		return

	award_notes(1)
	active_notes.erase(closest_note)
	closest_note.queue_free()

func _on_auto_tap_button_pressed() -> void:
	var cost = auto_tap_cost()
	if notes_value < cost:
		return

	notes_value -= cost
	auto_tap_level += 1
	auto_tap_timer.wait_time = max(0.4, 1.0 - 0.1 * auto_tap_level)
	update_upgrade_labels()

func _on_multiplier_button_pressed() -> void:
	var cost = multiplier_cost()
	if notes_value < cost:
		return

	notes_value -= cost
	multiplier_level += 1
	update_upgrade_labels()

func auto_tap_cost() -> int:
	return 10 + auto_tap_level * 8

func multiplier_cost() -> int:
	return 15 + multiplier_level * 12

func update_upgrade_labels() -> void:
	auto_tap_label.text = "Auto Tap Lv %d  Cost: %d" % [auto_tap_level, auto_tap_cost()]
	multiplier_label.text = "Multiplier Lv %d  Cost: %d" % [multiplier_level, multiplier_cost()]
	notes_label.text = "Notes: %d" % notes_value

func _on_btn_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home/home.tscn")
