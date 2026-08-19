extends Node

signal authenticated(success: bool)

@onready var sign_in: PlayGamesSignInClient = $PlayGamesSignInClient
@onready var achievements: PlayGamesAchievementsClient = $PlayGamesAchievementsClient

var _is_signed_in: bool = false


func _enter_tree() -> void:
	GodotPlayGameServices.initialize()


func initialize() -> void:
	sign_in.user_authenticated.connect(_on_user_authenticated)
	achievements.achievement_unlocked.connect(_on_achievement_unlocked)
	sign_in.sign_in()


func is_ready() -> bool:
	return _is_signed_in


func unlock(platform_id: String) -> void:
	if not _is_signed_in:
		print("AchievementBackend (Android): not signed in, skipping ", platform_id)
		return
	achievements.unlock(platform_id)


func show_ui() -> void:
	if _is_signed_in:
		achievements.show_achievements()


func _on_user_authenticated(success: bool) -> void:
	print("AndroidBackend: authenticated = ", success)
	_is_signed_in = success
	authenticated.emit(success)


func _on_achievement_unlocked(achievement_id: String) -> void:
	print("AchievementBackend (Android): unlocked ", achievement_id)
