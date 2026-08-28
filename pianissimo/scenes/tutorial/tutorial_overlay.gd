extends CanvasLayer
class_name TutorialOverlay

signal finished

@onready var comic_image: TextureRect = $Dim/PanelCenter/ComicImage
@onready var next_button: Button = $Dim/BottomBar/NextButton
@onready var skip_button: Button = $Dim/BottomBar/SkipButton

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
	next_button.pressed.connect(_on_next_pressed)
	skip_button.pressed.connect(_on_skip_pressed)
	_show_step()

func _show_step() -> void:
	comic_image.texture = _panels[_step]
	next_button.text = tr("TUTORIAL_GOT_IT") if _step == _panels.size() - 1 else tr("TUTORIAL_NEXT")

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
