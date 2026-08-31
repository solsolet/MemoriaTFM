extends CanvasLayer
class_name TutorialOverlay

signal finished

const ARROW_RIGHT := preload("res://assets/sprites/icons/arrow_right.svg")

@export var comic_image: TextureRect
@export var back_button: Button
@export var next_button: Button
@export var skip_button: Button

var _panels: Array[Texture2D] = []
var _step: int = 0
var _tutorial_id: String = ""


func setup(tutorial_id: String) -> void:
	_tutorial_id = tutorial_id
	var def := TutorialManager.get_definition(tutorial_id)
	if def == null or def.panels.is_empty():
		queue_free()
		return
	_panels = def.panels
	back_button.pressed.connect(_on_back_pressed)
	next_button.pressed.connect(_on_next_pressed)
	skip_button.pressed.connect(_on_skip_pressed)
	_show_step()


func _show_step() -> void:
	comic_image.texture = _panels[_step]
	back_button.visible = _step > 0
	if _step == _panels.size() - 1:
		next_button.text = tr("TUTORIAL_GOT_IT")
		next_button.icon = null
	else:
		next_button.text = ""
		next_button.icon = ARROW_RIGHT


# INFO: Pressed buttons
func _on_back_pressed() -> void:
	if _step > 0:
		_step -= 1
		_show_step()

func _on_next_pressed() -> void:
	_step += 1
	if _step >= _panels.size():
		_finish()
	else:
		_show_step()

func _on_skip_pressed() -> void:
	_finish()


func _finish() -> void:
	TutorialManager.mark_seen(_tutorial_id)
	finished.emit()
	queue_free()
