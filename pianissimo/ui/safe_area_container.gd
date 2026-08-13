extends MarginContainer

const MIN_SIDE_MARGIN: float = 16.0


func _ready() -> void:
	call_deferred("_apply_safe_area")
	get_viewport().size_changed.connect(_on_viewport_size_changed)


func _apply_safe_area() -> void:
	var viewport_rect = get_viewport().get_visible_rect()
	var safe_area = DisplayServer.get_display_safe_area() # physical screen pixels
	var window_size = DisplayServer.window_get_size()

	# convert to the viewport's logical pixel space
	var scale_x = viewport_rect.size.x / float(window_size.x)
	var scale_y = viewport_rect.size.y / float(window_size.y)
	
	var left = int(max(MIN_SIDE_MARGIN, safe_area.position.x * scale_x))
	var top = int(max(0.0, safe_area.position.y * scale_y))
	var right = int(max(MIN_SIDE_MARGIN, viewport_rect.size.x - safe_area.position.x - safe_area.size.x) * scale_x)
	var bottom = int(max(0.0, viewport_rect.size.y - safe_area.position.y - safe_area.size.y) * scale_y)
	
	#print("Safe area: ", safe_area, " | viewport: ", viewport_rect.size, " | bottom margin: ", bottom)

	add_theme_constant_override("margin_left", left)
	add_theme_constant_override("margin_top", top)
	add_theme_constant_override("margin_right", right)
	add_theme_constant_override("margin_bottom", bottom)


func _on_viewport_size_changed() -> void:
	call_deferred("_apply_safe_area")
