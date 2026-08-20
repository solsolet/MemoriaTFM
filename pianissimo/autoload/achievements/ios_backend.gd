extends Node

signal authenticated(success: bool)

var _singleton: Object = null
var _is_signed_in: bool = false


func initialize() -> void:
	if not Engine.has_singleton("GameCenter"):
		push_warning("AchievementBackend (iOS): GameCenter singleton missing")
		return
	_singleton = Engine.get_singleton("GameCenter")
	print("GameCenter methods: ", _singleton.get_method_list())
	print("GameCenter signals: ", _singleton.get_signal_list())
	
	var error = _singleton.authenticate()
	print("GameCenter authenticate() returned: ", error)


func is_ready() -> bool:
	return _is_signed_in


func unlock(platform_id: String) -> void:
	if not _is_signed_in or _singleton == null:
		print("AchievementBackend (iOS): not signed in, skipping ", platform_id)
		return
	_singleton.award_achievement({"name": platform_id, "percent_complete": 100.0})


func show_ui() -> void:
	if _singleton != null:
		_singleton.show_game_center()


func _on_game_center_event(event: Dictionary) -> void:
	match event.get("type", ""):
		"authentication":
			_is_signed_in = event.get("result", false)
			authenticated.emit(_is_signed_in)
		"award_achievement":
			print("AchievementBackend (iOS): unlock result ", event)
