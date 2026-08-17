extends Node
## Facade for achievements

signal achievement_unlocked(id: String)

const ANDROID_BACKEND_SCENE = preload("res://autoload/achievements/android_backend.tscn")
const IOS_BACKEND_SCENE = preload("res://autoload/achievements/ios_backend.tscn")

@export var definitions: Array[AchievementDefinition] = []

var _definitions: Dictionary = {}
var _backend: Node = null
var _pending_unlocks: Array[String] = []


func _ready() -> void:
	for def in definitions:
		if def != null and def.id != "":
			_definitions[def.id] = def

	match OS.get_name():
		"Android":
			_backend = ANDROID_BACKEND_SCENE.instantiate()
		"iOS":
			_backend = IOS_BACKEND_SCENE.instantiate()
		_:
			_backend = null

	if _backend:
		add_child(_backend)
		_backend.authenticated.connect(_on_backend_authenticated)
		_backend.initialize()
	else:
		print("AchievementManager: no native backend for '%s' -- editor/desktop testing" % OS.get_name())

	Economy.notes_changed.connect(_on_notes_changed)


func unlock(id: String) -> void:
	if SaveManager.data.unlocked_achievements.has(id):
		return

	var def: AchievementDefinition = _definitions.get(id)
	if def == null:
		push_warning("AchievementManager: unknown achievement id '%s'" % id)
		return

	SaveManager.data.unlocked_achievements.append(id)
	SaveManager.save_data()
	achievement_unlocked.emit(id)
	_dispatch(def)


func show_achievements_ui() -> void:
	if _backend:
		_backend.show_ui()


func _dispatch(def: AchievementDefinition) -> void:
	if _backend == null:
		return
	if not _backend.is_ready():
		_pending_unlocks.append(def.id)  # not signed in yet -- try again once we are
		return
	_send(def)


func _send(def: AchievementDefinition) -> void:
	var platform_id: String = def.android_id if OS.get_name() == "Android" else def.ios_id
	if platform_id != "":
		_backend.unlock(platform_id)


func _on_backend_authenticated(success: bool) -> void:
	if not success:
		return
	for id in _pending_unlocks:
		var def: AchievementDefinition = _definitions.get(id)
		if def != null:
			_send(def)
	_pending_unlocks.clear()


func _on_notes_changed(_value: int) -> void:
	if SaveManager.data.total_notes_earned >= 1000:
		unlock("notes_1000")
