extends Control
class_name PianoKeyboard

signal key_pressed(lane_index: int)
signal layout_changed

const NOTE_SEQUENCE := ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
const BASE_LANE_COUNT := 3

@export var interior_border_width: int = 1  # same-row keys

var key_buttons: Array[Button] = []


func _ready() -> void:
	_build_keys()
	resized.connect(_layout_keys)
	StatManager.stat_purchased.connect(_on_stat_purchased)


func _style_key(button: Button, is_black: bool, index: int, total: int) -> void:
	var variation: StringName = &"BlackKeyButton" if is_black else &"WhiteKeyButton"
	button.theme_type_variation = variation

	# Real keys sit edge-to-edge, unlike Home's stacked column -- thin out the
	# shared side borders so neighbors don't double up into a thick seam.
	var base_style: StyleBoxFlat = ThemeDB.get_project_theme().get_stylebox("normal", variation)
	var style := base_style.duplicate() as StyleBoxFlat
	if index > 0:
		style.border_width_left = interior_border_width
	if index < total - 1:
		style.border_width_right = interior_border_width
	button.add_theme_stylebox_override("normal", style)


func current_lane_count() -> int:
	var level := StatManager.get_level("keyboard")
	return min(BASE_LANE_COUNT + level, NOTE_SEQUENCE.size())


func get_key_rect(lane_index: int) -> Rect2:
	return key_buttons[lane_index].get_global_rect()


func _is_black_key(lane_index: int) -> bool:
	return NOTE_SEQUENCE[lane_index].ends_with("#")


func _build_keys() -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	key_buttons.clear()

	for i in current_lane_count():
		var button := Button.new()
		button.name = "Key%d" % i
		if _is_black_key(i):
			_style_key(button, _is_black_key(i), i, current_lane_count())
		else:
			_style_key(button, false, i, current_lane_count())
		add_child(button)
		key_buttons.append(button)
		button.pressed.connect(key_pressed.emit.bind(i))

	call_deferred("_layout_keys")


func _layout_keys() -> void:
	var width := size.x
	var height := size.y

	var white_keys: Array[Button] = []
	var black_keys: Array[Dictionary] = []
	var white_index := 0
	for i in key_buttons.size():
		if _is_black_key(i):
			black_keys.append({"button": key_buttons[i], "after_white_index": white_index - 1})
		else:
			white_keys.append(key_buttons[i])
			white_index += 1

	if white_keys.is_empty():
		return

	var white_width := width / float(white_keys.size())
	for i in white_keys.size():
		white_keys[i].position = Vector2(i * white_width, 0)
		white_keys[i].size = Vector2(white_width, height)

	var black_width := white_width * 0.5
	var black_height := height * 0.6
	for entry in black_keys:
		var button: Button = entry["button"]
		var after_index: int = entry["after_white_index"]
		if after_index < 0:
			continue
		button.position = Vector2((after_index + 1) * white_width - black_width * 0.5, 0)
		button.size = Vector2(black_width, black_height)
		button.move_to_front()

	layout_changed.emit()


func _on_stat_purchased(id: String, _new_level: int) -> void:
	if id == "keyboard":
		_build_keys()
