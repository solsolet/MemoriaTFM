extends Control
class_name Note

signal missed(note: Note)

@export var visual: Control

var lane: int = 0
var speed: float = 220.0
var miss_y: float = 0.0 # y-coordinate of the hit line, in this note's parent space


func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y + size.y >= miss_y:
		missed.emit(self)
		queue_free()


# INFO: Resize note root and its visual child
func set_note_size(new_size: Vector2) -> void:
	self.size = new_size
	visual.size = new_size
	visual.custom_minimum_size = new_size
