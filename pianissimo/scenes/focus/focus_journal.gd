extends Control

@export var entries_container: VBoxContainer


func _ready() -> void:
	AudioManager.ensure_playlist_playing(["menu1.mp3"])
	
	_populate()


func _populate() -> void:
	for child in entries_container.get_children():
		child.queue_free()
	
	var history: Array = SaveManager.data.focus_history
	if history.is_empty():
		var empty_label := Label.new()
		empty_label.text = "No focus sessions yet."
		entries_container.add_child(empty_label)
		return
	
	for i in range(history.size() -1, -1, -1):
		entries_container.add_child(_build_row(history[i], i))


func _build_row(entry: Dictionary, history_index: int) -> Control:
	var row := HBoxContainer.new()
	var info := VBoxContainer.new()
	
	info.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	var title_label := Label.new()
	var status := "Completed" if entry.get("completed", false) else "Failed"
	title_label.text = "[%s]  %s" % [status, entry.get("title", "")]
	info.add_child(title_label)

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
	delete_button.text = "🗑"
	delete_button.pressed.connect(func():
		SaveManager.data.focus_history.remove_at(history_index)
		SaveManager.save_data()
		_populate()
	)
	row.add_child(delete_button)
	
	return row

func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_SETUP)
