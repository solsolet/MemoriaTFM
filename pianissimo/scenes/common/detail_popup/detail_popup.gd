extends CanvasLayer
class_name DetailPopup

@export var dim: ColorRect
@export var title_label: Label
@export var desc_label: Label
@export var close_button: Button

func _ready() -> void:
	close_button.pressed.connect(queue_free) # WARNING: podria fer-ho funció a banda per a posar: AudioManager.play_ui_click()
	dim.gui_input.connect(_on_dim_input)

func _on_dim_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		queue_free()

func setup(title: String, description: String) -> void:
	title_label.text = title
	desc_label.text = description
