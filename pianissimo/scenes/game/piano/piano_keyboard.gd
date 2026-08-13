extends Control
class_name PianoKeyboard

signal key_pressed(lane_index: int)
signal layout_changed

const NOTE_SEQUENCE := ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
const BASE_LANE_COUNT := 3

var key_buttons: Array[Button] = []

var _white_key_normal: StyleBoxFlat
var _white_key_pressed: StyleBoxFlat
var _black_key_normal: StyleBoxFlat
var _black_key_pressed: StyleBoxFlat


func _ready() -> void:
	_white_key_normal = StyleBoxFlat.new()
	_white_key_normal.bg_color = Color(0.96, 0.96, 0.93, 1)
	_white_key_normal.border_color = Color(0.75, 0.75, 0.72, 1)
	_white_key_normal.border_width_bottom = 2
	_white_key_normal.corner_radius_bottom_left = 4
	_white_key_normal.corner_radius_bottom_right = 4

	_white_key_pressed = _white_key_normal.duplicate()
	_white_key_pressed.bg_color = Color(0.90, 0.80, 0.45, 1)

	_black_key_normal = StyleBoxFlat.new()
	_black_key_normal.bg_color = Color(0.08, 0.08, 0.08, 1)
	_black_key_normal.corner_radius_bottom_left = 4
	_black_key_normal.corner_radius_bottom_right = 4

	_black_key_pressed = _black_key_normal.duplicate()
	_black_key_pressed.bg_color = Color(0.55, 0.45, 0.15, 1)

	_build_keys()
	resized.connect(_layout_keys)
	StatManager.stat_purchased.connect(_on_stat_purchased)


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
			button.add_theme_stylebox_override("normal", _black_key_normal)
			button.add_theme_stylebox_override("hover", _black_key_normal)
			button.add_theme_stylebox_override("pressed", _black_key_pressed)
			button.add_theme_color_override("font_color", Color(1, 1, 1, 1))
		else:
			button.add_theme_stylebox_override("normal", _white_key_normal)
			button.add_theme_stylebox_override("hover", _white_key_normal)
			button.add_theme_stylebox_override("pressed", _white_key_pressed)
			button.add_theme_color_override("font_color", Color(0.1, 0.1, 0.1, 1))
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
