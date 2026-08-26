extends Control

@export var entries_container: VBoxContainer
@export var totals_label: Label


func _ready() -> void:
	AudioManager.ensure_playlist_playing(["menu1.mp3"])
	
	_populate()
	_update_totals()


func _populate() -> void:
	for child in entries_container.get_children():
		child.queue_free()
	
	var history: Array = SaveManager.data.focus_history
	if history.is_empty():
		var empty_label := Label.new()
		empty_label.text = tr("PRACTISE_JOURNAL_EMPTY")
		entries_container.add_child(empty_label)
		return
	
	for i in range(history.size() -1, -1, -1):
		entries_container.add_child(_build_row(history[i], i))


func _build_row(entry: Dictionary, history_index: int) -> Control:
	var panel := PanelContainer.new()
	panel.theme_type_variation = &"JournalRowPanel"

	var row := HBoxContainer.new()
	panel.add_child(row)

	var info := VBoxContainer.new()
	info.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	var title_row := HBoxContainer.new()
	if entry.get("tag", "") != "":
		title_row.add_child(_build_tag_dot(entry.get("tag_color", Color.GRAY)))
	var title_label := Label.new()
	var status := tr("PRACTISE_JOURNAL_COMPLETED") if entry.get("completed", false) else tr("PRACTISE_JOURNAL_FAILED")
	title_label.text = "[%s]  %s" % [status, entry.get("title", "")]
	title_row.add_child(title_label)
	info.add_child(title_row)

	if entry.get("description", "") != "":
		var desc_label := Label.new()
		desc_label.theme_type_variation = &"CardLabel"
		desc_label.text = entry["description"]
		info.add_child(desc_label)

	var meta_label := Label.new()
	meta_label.theme_type_variation = &"CardLabel"
	var date_str := Time.get_datetime_string_from_unix_time(entry.get("started_at", 0), true)
	var actual_min: int = int(entry.get("actual_seconds", 0)) / 60
	var target_min: int = int(entry.get("target_seconds", 0)) / 60
	meta_label.text = "%s  -  %d / %d min" % [date_str, actual_min, target_min]
	info.add_child(meta_label)

	row.add_child(info)

	var delete_button := Button.new()
	delete_button.icon = preload("res://assets/sprites/trash.svg")
	delete_button.text = ""
	delete_button.theme_type_variation = &"CancelButton"
	delete_button.pressed.connect(func():
		SaveManager.data.focus_history.remove_at(history_index)
		SaveManager.save_data()
		_populate()
	)
	row.add_child(delete_button)

	return panel

func _build_tag_dot(color: Color) -> Control:
	var dot := Panel.new()
	dot.custom_minimum_size = Vector2(20, 20)
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.corner_radius_top_left = 15
	style.corner_radius_top_right = 15
	style.corner_radius_bottom_left = 15
	style.corner_radius_bottom_right = 15
	dot.add_theme_stylebox_override("panel", style)
	return dot


func _update_totals() -> void:
	var now := int(Time.get_unix_time_from_system())
	var day_start := now - (now % 86400)
	var week_start := now - 7 * 86400
	var today := 0
	var week := 0
	for entry in SaveManager.data.focus_history:
		var t: int = entry.get("started_at", 0)
		var secs: int = entry.get("actual_seconds", 0)
		if t >= week_start:
			week += secs
		if t >= day_start:
			today += secs
	totals_label.text = tr("PRACTISE_JOURNAL_TODAY_WEEK_TOTALS") % [today / 60, week / 60]


func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_SETUP)
