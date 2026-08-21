extends Node

signal authenticated(success: bool)

var _singleton: Object = null
var _is_signed_in: bool = false


func initialize() -> void:
	if not Engine.has_singleton("GameCenter"):
		push_error("AchievementBackend (iOS): GameCenter singleton missing")
		return

	_singleton = Engine.get_singleton("GameCenter")

	var result = _singleton.authenticate()
	print("GameCenter authenticate() returned: ", result)

	set_process(true)


func _process(_delta: float) -> void:
	if _singleton == null:
		return

	while _singleton.get_pending_event_count() > 0:
		var event: Dictionary = _singleton.pop_pending_event()
		print("GameCenter event: ", event)
		_handle_event(event)


func _handle_event(event: Dictionary) -> void:
	match event.get("type", ""):
		"authentication":
			_is_signed_in = event.get("result", "") == "ok"

			print("AchievementBackend (iOS): authenticated = ", _is_signed_in)

			authenticated.emit(_is_signed_in)

		"award_achievement":
			print("AchievementBackend (iOS): unlock result ", event )

		_:
			print("AchievementBackend (iOS): event ", event)


func is_ready() -> bool:
	return _is_signed_in


func unlock(platform_id: String) -> void:
	if not _is_signed_in or _singleton == null:
		print("AchievementBackend (iOS): not signed in, skipping ", platform_id)
		return

	var result = _singleton.award_achievement({
		"name": platform_id,
		"progress": 100.0,
	})

	print("AchievementBackend (iOS): award_achievement returned ", result, " for ", platform_id)


func show_ui() -> void:
	if not _is_signed_in or _singleton == null:
		print("AchievementBackend (iOS): cannot show Game Center")
		return

	var result = _singleton.show_game_center({}) # es pot especificar el que volem que mostre, p.e. "view": "achievements"
	print("AchievementBackend (iOS): show_game_center returned ", result)
