extends Control

@onready var entries_container: VBoxContainer = $SafeArea/VBoxContainer/ScrollContainer/EntriesContainer


func _ready() -> void:
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
		entries_container.add_child(_build_row(history[i]))


func _build_row(entry: Dictionary) -> Control:
	var row := VBoxContainer.new()

	var title_label := Label.new()
	var status := "Completed" if entry.get("completed", false) else "Failed"
	title_label.text = "[%s]  %s" % [status, entry.get("title", "")]
	row.add_child(title_label)

	if entry.get("description", "") != "":
		var desc_label := Label.new()
		desc_label.theme_type_variation = &"CardLabel"
		desc_label.text = entry["description"]
		row.add_child(desc_label)

	var meta_label := Label.new()
	meta_label.theme_type_variation = &"CardLabel"
	var date_str := Time.get_datetime_string_from_unix_time(entry.get("started_at", 0), true)
	var actual_min: int = int(entry.get("actual_seconds", 0)) / 60
	var target_min: int = int(entry.get("target_seconds", 0)) / 60
	meta_label.text = "%s  -  %d / %d min" % [date_str, actual_min, target_min]
	row.add_child(meta_label)

	row.add_child(HSeparator.new())
	return row

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(ScenePaths.FOCUS_SETUP)
