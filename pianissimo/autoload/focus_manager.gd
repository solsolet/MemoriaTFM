extends Node

signal session_started
signal session_completed(reward: int)
signal session_failed
signal session_cancelled

const BASE_REWARD := 20
const REWARD_PER_MINUTE := 4
#const TAG_PALETTE := [Color("#FF8C38"), Color("#3D7DDB"), Color("#6EE7D9"), Color("#FF6B6B"), Color("#9CE8A8")]

enum Mode { STRICT, PERMISSIVE }
var mode: Mode = Mode.STRICT

var is_active: bool = false
var target_seconds: int = 0
var elapsed_seconds: float = 0.0
var title: String = ""
var description: String = ""
var tag: String = ""
var tag_color: Color = Color.TRANSPARENT
var last_completed: bool = false
var last_reward: int = 0

var _timer: Timer

var last_unlocked_card_id: String = ""


func _ready() -> void:
	_timer = Timer.new()
	_timer.wait_time = 1.0
	_timer.timeout.connect(_on_tick)
	add_child(_timer)

	_check_for_crashed_session()


func _check_for_crashed_session() -> void:
	# If this flag is still true at boot, the app never reached a clean
	# completion last time -- it was killed mid-session, not just backgrounded.
	if not SaveManager.data.focus_session_in_progress:
		return
	var start: int = SaveManager.data.focus_session_start_time
	var target: int = SaveManager.data.focus_session_target_seconds
	var elapsed := int(Time.get_unix_time_from_system()) - start
	
	if SaveManager.data.focus_session_in_progress:
		var saved_mode: Mode = SaveManager.data.focus_session_mode as Mode
		if saved_mode == Mode.PERMISSIVE and elapsed >= target:
			var reward := BASE_REWARD + int((target / 60.0) * REWARD_PER_MINUTE)
			Economy.add(reward)
			CardManager.unlock_random_card()
			_log_session(
				SaveManager.data.focus_session_title,
				SaveManager.data.focus_session_description,
				SaveManager.data.focus_session_tag,
				SaveManager.data.focus_session_tag_color,
				target, target, true, start)
		else:
			_log_session(
				SaveManager.data.focus_session_title,
				SaveManager.data.focus_session_description,
				SaveManager.data.focus_session_tag,
				SaveManager.data.focus_session_tag_color,
				target, min(elapsed, target), false, start)
		_clear_persisted_session()


func start_session(p_title: String, p_description: String, p_target_seconds: int, p_tag: String, p_tag_color: Color, p_mode: Mode) -> void:
	mode = p_mode
	title = p_title
	description = p_description
	target_seconds = p_target_seconds
	tag = p_tag
	tag_color = p_tag_color
	elapsed_seconds = 0.0
	is_active = true

	SaveManager.data.focus_session_mode = int(p_mode)
	SaveManager.data.focus_session_in_progress = true
	SaveManager.data.focus_session_start_time = int(Time.get_unix_time_from_system())
	SaveManager.data.focus_session_target_seconds = p_target_seconds
	SaveManager.data.focus_session_title = p_title
	SaveManager.data.focus_session_description = p_description
	SaveManager.data.focus_session_tag = p_tag
	SaveManager.data.focus_session_tag_color = p_tag_color
	SaveManager.save_data()

	_timer.start()
	session_started.emit()


func _on_tick() -> void:
	if not is_active:
		return
	elapsed_seconds = float(Time.get_unix_time_from_system() - SaveManager.data.focus_session_start_time)
	if elapsed_seconds >= target_seconds:
		_complete_session()


func _complete_session() -> void:
	if not is_active:
		return
	is_active = false
	_timer.stop()

	var reward := BASE_REWARD + int((target_seconds / 60.0) * REWARD_PER_MINUTE)
	Economy.add(reward)
	last_completed = true
	last_reward = reward
	last_unlocked_card_id = CardManager.unlock_random_card()
	AchievementManager.unlock("first_focus_session")

	_log_session(title, description, tag, tag_color, target_seconds, target_seconds, true, SaveManager.data.focus_session_start_time)
	_clear_persisted_session()
	session_completed.emit(reward)


func fail_session() -> void:
	if not is_active:
		return
	is_active = false
	_timer.stop()
	last_completed = false
	last_reward = 0

	_log_session(title, description, tag, tag_color, target_seconds, int(elapsed_seconds), false, SaveManager.data.focus_session_start_time)
	_clear_persisted_session()
	session_failed.emit()


func _log_session(p_title: String, p_description: String, p_tag: String, p_tag_color: Color, p_target: int, p_actual: int, p_completed: bool, p_started_at: int) -> void:
	SaveManager.data.focus_history.append({
		"title": p_title,
		"description": p_description,
		"tag": p_tag,
		"tag_color": p_tag_color,
		"target_seconds": p_target,
		"actual_seconds": p_actual,
		"completed": p_completed,
		"started_at": p_started_at,
	})
	SaveManager.save_data()


func _clear_persisted_session() -> void:
	SaveManager.data.focus_session_in_progress = false
	SaveManager.data.focus_session_start_time = 0
	SaveManager.data.focus_session_target_seconds = 0
	SaveManager.data.focus_session_title = ""
	SaveManager.data.focus_session_description = ""
	SaveManager.data.focus_session_tag = ""
	SaveManager.data.focus_session_tag_color = Color.TRANSPARENT
	SaveManager.save_data()


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_WM_CLOSE_REQUEST:
		if is_active and mode == Mode.STRICT:
			fail_session()
		# PERMISSIVE: do nothing


# INFO: cancel without penalization if you do it in the time permited
func cancel_session() -> void:
	if not is_active:
		return
	is_active = false
	_timer.stop()
	_clear_persisted_session()
	session_cancelled.emit()
