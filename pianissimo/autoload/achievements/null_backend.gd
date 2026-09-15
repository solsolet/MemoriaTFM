extends Node

signal authenticated(success: bool)

func initialize() -> void:
	print("AchievementBackend (null): no native service on this platform")

func is_ready() -> bool:
	return false

func unlock(platform_id: String) -> void:
	print("AchievementBackend (null): would unlock '%s'" % platform_id)

func show_ui() -> void:
	print("AchievementBackend (null): no native UI available")
