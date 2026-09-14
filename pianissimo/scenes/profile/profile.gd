extends Control

@export var level_label: Label
@export var cards_label: Label
@export var achievements_label: Label
@export var view_achievements_button: Button
@export var focus_label: Label
@export var stats_container: VBoxContainer
@export var passive_rate_label: Label
@export var back_button: Button


func _ready() -> void:
	#AudioManager.ensure_playlist_playing(SaveManager.data.unlocked_tracks)
	AudioManager.ensure_playlist_playing(["menu1.mp3"])

	level_label.text = tr("PROFILE_LEVEL") % LevelManager.current_level()
	cards_label.text = tr("PROFILE_CARDS") % [SaveManager.data.unlocked_cards.size(), CardManager.get_all_ids().size()]
	achievements_label.text = tr("PROFILE_ACHIEVEMENTS") % SaveManager.data.unlocked_achievements.size()
	passive_rate_label.text = tr("PROFILE_PASSIVE_RATE") % UpgradeManager.total_passive_rate()

	for stat_id in StatManager.get_all_ids():
		stats_container.add_child(_build_stat_row(stat_id))

	var totals := _focus_totals()
	focus_label.text = tr("PROFILE_FOCUS_TOTALS") % [totals.x / 60, totals.y / 60]

	view_achievements_button.pressed.connect(_on_achievements_button_pressed)
	back_button.pressed.connect(func(): get_tree().call_deferred("change_scene_to_file", ScenePaths.HOME))


func _build_stat_row(stat_id: String) -> Control:
	var row := HBoxContainer.new()
	var name_label := Label.new()
	name_label.text = tr(StatManager.get_definition(stat_id).display_name)
	name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var value_label := Label.new()
	value_label.text = "Lv %d" % StatManager.get_level(stat_id)
	row.add_child(name_label)
	row.add_child(value_label)
	return row


func _focus_totals() -> Vector2i:
	var now := int(Time.get_unix_time_from_system())
	var day_start := now - (now % 86400)
	var week_start := now - 7 * 86400
	var today := 0
	var week := 0
	for entry in SaveManager.data.focus_history:
		if not entry.get("completed", false):
			continue
		var t: int = entry.get("started_at", 0)
		var secs: int = entry.get("actual_seconds", 0)
		if t >= week_start:
			week += secs
		if t >= day_start:
			today += secs
			
	return Vector2i(today, week)


func _stat_effect_text(stat_id: String) -> String:
	var level := StatManager.get_level(stat_id)
	match stat_id:
		"velocity":
			var interval = max(Piano.MIN_SPAWN_INTERVAL, Piano.BASE_SPAWN_INTERVAL * pow(Piano.VELOCITY_SPEEDUP_PER_LEVEL, level))
			return tr("PROFILE_STAT_VELOCITY") % interval
		"precision":
			return tr("PROFILE_STAT_PRECISION") % int(NoteField.PRECISION_BASE_PERFECT + level * NoteField.PRECISION_PER_LEVEL)
		"technique":
			return tr("PROFILE_STAT_TECHNIQUE") % level
		"keyboard":
			return tr("PROFILE_STAT_KEYBOARD") % min(3 + level, PianoKeyboard.NOTE_SEQUENCE.size())
		_:
			return ""


func _on_achievements_button_pressed() -> void:
	AudioManager.play_ui_click()
	AchievementManager.show_achievements_ui()
