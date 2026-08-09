extends MarginContainer

func _ready() -> void:
	call_deferred("_apply_safe_area")

func _apply_safe_area() -> void:
	var viewport_rect = get_viewport().get_visible_rect()
	var safe_area = DisplayServer.get_display_safe_area()

	var left = int(max(0.0, safe_area.position.x))
	var top = int(max(0.0, safe_area.position.y))
	var right = int(max(0.0, viewport_rect.size.x - safe_area.position.x - safe_area.size.x))
	var bottom = int(max(0.0, viewport_rect.size.y - safe_area.position.y - safe_area.size.y))

	add_theme_constant_override("margin_left", left)
	add_theme_constant_override("margin_top", top)
	add_theme_constant_override("margin_right", right)
	add_theme_constant_override("margin_bottom", bottom)
