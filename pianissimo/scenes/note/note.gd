extends Control
class_name Note

var lane: int = 0
var speed: float = 220.0

func set_note_size(new_size: Vector2) -> void:
	# Resize note root and its visual child
	self.size = new_size
	if has_node("ColorRect"):
		var color_rect = $ColorRect as Control
		color_rect.size = new_size
		color_rect.custom_minimum_size = new_size
