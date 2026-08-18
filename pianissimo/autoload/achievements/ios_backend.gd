extends Node

signal authenticated(success: bool)

var _singleton: Object = null
var _is_signed_in: bool = false


func initialize() -> void:
	if not Engine.has_singleton("GameCenter"):
		push_warning("AchievementBackend (iOS): GameCenter singleton missing -- check Project Settings > Plugins and the iOS export preset's Plugins section")
		return
	_singleton = Engine.get_singleton("GameCenter")
	# VERIFY: signal name/shape against the plugin's current README --
	# this is the part most likely to have moved since I last checked.
	if _singleton.has_signal("game_center_event"):
		_singleton.connect("game_center_event", _on_game_center_event)
	_singleton.authenticate()


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
