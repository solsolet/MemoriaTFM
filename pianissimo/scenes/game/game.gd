extends Control

const NOTE_SCENE = preload("res://scenes/note/note.tscn")
const NOTE_HEIGHT = 36.0
const TUTORIAL_OVERLAY_SCENE = preload("res://scenes/tutorial/tutorial_overlay.tscn")
const WELCOME_BACK_TOAST_SCENE = preload("res://scenes/common/welcome_back_toast/welcome_back_toast.tscn")
const FLOATING_SCORE_SCENE = preload("res://scenes/common/floating_score_popup/floating_score_popup.tscn")

const MIN_OFFLINE_SECONDS_FOR_TOAST := 30

@export var notes_label: Label
@export var settings_button: Button
@export var piano: Piano

var active_notes: Array[Note] = []
var spawn_timer: Timer
var auto_tap_timer: Timer
var _passive_timer: Timer
var note_speed: float = 220.0


func _ready() -> void:
	if not TutorialManager.has_been_seen("game_intro"):
		var overlay := TUTORIAL_OVERLAY_SCENE.instantiate() as TutorialOverlay
		add_child(overlay)
		overlay.setup("game_intro")
	
	settings_button.pressed.connect(_on_settings_button_pressed)
	Economy.notes_changed.connect(_on_notes_changed)
	_on_notes_changed(Economy.notes)
	
	piano.note_scored.connect(_on_note_scored)
	
	_apply_offline_income()

	_apply_ui_scaling()
	get_viewport().size_changed.connect(_apply_ui_scaling)
	
	_passive_timer = Timer.new()
	_passive_timer.wait_time = 1.0
	_passive_timer.autostart = true
	_passive_timer.timeout.connect(_on_passive_tick)
	add_child(_passive_timer)
	
	AudioManager.ensure_playlist_playing(["Fugue No.2 Cm.mp3"])


# INFO: UI
func _apply_ui_scaling() -> void:
	var viewport_height = max(1.0, get_viewport().size.y)
	var font_size = int(clamp(viewport_height * 0.028, 18, 34))

	notes_label.add_theme_font_size_override("font_size", int(font_size * 1.4))


# INFO: Notifications
func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_PAUSED, NOTIFICATION_APPLICATION_FOCUS_OUT:
			SaveManager.save_data()
		NOTIFICATION_APPLICATION_RESUMED, NOTIFICATION_APPLICATION_FOCUS_IN:
			_apply_offline_income()
			SaveManager.save_data()


func _on_upgrade_purchased(id: String, new_level: int) -> void:
	if id == "auto_tap":
		auto_tap_timer.wait_time = max(0.4, 1.0 - 0.1 * new_level)


func _apply_offline_income() -> void:
	var now = int(Time.get_unix_time_from_system())
	var elapsed = max(0, now - SaveManager.data.last_save_time)
	if elapsed <= 0:
		return
	
	var auto_tap_rate = 1.0 + UpgradeManager.get_level("auto_tap") * 0.5
	var passive_rate = UpgradeManager.total_passive_rate()
	var offline_gain = int(elapsed * (auto_tap_rate + passive_rate))
	if offline_gain > 0:
		Economy.add(offline_gain)
		print("Offline gain: ", offline_gain)
		if elapsed >= MIN_OFFLINE_SECONDS_FOR_TOAST:
			var toast := WELCOME_BACK_TOAST_SCENE.instantiate() as WelcomeBackToast
			add_child(toast)
			toast.show_reward(offline_gain)


func _on_notes_changed(value: int) -> void:
	notes_label.text = "Notes: %d " % value


func _on_note_scored(_lane: int, accuracy: String) -> void:
	if accuracy == "golden":
		Economy.add(1000)	# WARNING: Saber que ací puc augmentar el premi per golden note
		_spawn_floating_score(_lane, "+1000", Color("#FFD34D"))
		return
	
	var base_amount := 1
	if accuracy == "perfect":
		base_amount = 2 + StatManager.get_level("technique")
	var reward = base_amount * (1 + UpgradeManager.get_level("multiplier"))
	Economy.add(reward)
	
	var color := Color("#FF8C38") if accuracy == "perfect" else Color("#6EE7D9")
	_spawn_floating_score(_lane, "+%d" % reward, color)


func _spawn_floating_score(lane: int, text: String, color: Color) -> void:
	var key_rect := piano.keyboard.get_key_rect(lane)
	var popup := FLOATING_SCORE_SCENE.instantiate() as FloatingScorePopup
	add_child(popup)
	popup.play(text, color, key_rect.position + key_rect.size * 0.5)


func _on_passive_tick() -> void:
	var rate := UpgradeManager.total_passive_rate()
	if rate > 0.0:
		Economy.add(int(round(rate)))


# Stop timers and clear notes when leaving the scene
func cleanup() -> void:
	if piano:
		piano.cleanup()
	AudioManager.stop_music()
	_passive_timer.stop()
	SaveManager.save_data()


func _exit_tree() -> void:
	cleanup()
	if get_viewport().size_changed.is_connected(_apply_ui_scaling):
		get_viewport().size_changed.disconnect(_apply_ui_scaling)


func _on_btn_back_pressed() -> void:
	cleanup()
	get_tree().call_deferred("change_scene_to_file",ScenePaths.HOME)


func _on_settings_button_pressed() -> void:
	SettingsManager.return_scene_path = ScenePaths.GAME
	cleanup()
	get_tree().call_deferred("change_scene_to_file",ScenePaths.SETTINGS)
