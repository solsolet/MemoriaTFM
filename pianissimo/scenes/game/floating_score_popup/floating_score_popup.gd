extends Control
class_name FloatingScorePopup

@export var label: Label


func play(text: String, color: Color, start_position: Vector2) -> void:
	global_position = start_position
	label.text = text
	label.modulate = color
	mouse_filter = Control.MOUSE_FILTER_IGNORE

	var tween := create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "global_position:y", start_position.y - 80, 0.7).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(label, "modulate:a", 0.0, 0.7).set_delay(0.25)
	tween.chain().tween_callback(queue_free)
