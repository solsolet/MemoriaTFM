extends Node
## Saves game progress (custom Resource)

const SAVE_PATH := "user://player_save.tres"

var data: PlayerSaveData
var return_scene_path: String = ScenePaths.HOME


func _ready() -> void:
	load_data()


func load_data() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		var loaded = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE) # Ignore to reread file from disk, in case any changes
		data = loaded if loaded is PlayerSaveData else PlayerSaveData.new()
	else:
		# 1st run
		data = PlayerSaveData.new()
		data.last_save_time = int(Time.get_unix_time_from_system())

func save_data() -> void:
	data.last_save_time = int(Time.get_unix_time_from_system())
	var err := ResourceSaver.save(data, SAVE_PATH)
	if err != OK:
		push_warning("SaveManager: save failed (error %d)" % err)


func reset_data() -> void:
	data = PlayerSaveData.new()
	data.last_save_time = int(Time.get_unix_time_from_system())
	save_data()
