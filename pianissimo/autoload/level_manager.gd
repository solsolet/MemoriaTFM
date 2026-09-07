extends Node

signal leveled_up(level_number: int, def: LevelDefinition)

const WELCOME_BACK_TOAST_SCENE = preload("res://scenes/common/welcome_back_toast/welcome_back_toast.tscn")

@export var definitions: Array[LevelDefinition] = []


func _ready() -> void:
	definitions.sort_custom(func(a, b): return a.level_number < b.level_number)
	_ensure_tracks_for_current_level()
	Economy.notes_changed.connect(_check_level_up)
	StatManager.stat_purchased.connect(func(_id, _lvl): _check_level_up(Economy.notes))


func current_level() -> int:
	return SaveManager.data.player_level


func _check_level_up(_notes: int) -> void:
	var next_index := SaveManager.data.player_level
	if next_index >= definitions.size():
		return
	var def := definitions[next_index]
	var stat_total := StatManager.get_level("velocity") + StatManager.get_level("precision") + StatManager.get_level("technique") + StatManager.get_level("keyboard")
	if SaveManager.data.total_notes_earned >= def.notes_required and stat_total >= def.stat_investment_required:
		SaveManager.data.player_level = def.level_number
		SaveManager.save_data()
		for track in def.unlocked_tracks:
			if not SaveManager.data.unlocked_tracks.has(track):
				SaveManager.data.unlocked_tracks.append(track)

		var toast := WELCOME_BACK_TOAST_SCENE.instantiate() as WelcomeBackToast
		get_tree().root.add_child(toast)
		toast.show_message(tr("LEVEL_UP_MESSAGE") % [def.level_number, tr(def.era_name)], Color("#FFD34D"))

		leveled_up.emit(def.level_number, def)


func _ensure_tracks_for_current_level() -> void:
	for def in definitions:
		if def.level_number <= SaveManager.data.player_level:
			for track in def.unlocked_tracks:
				if not SaveManager.data.unlocked_tracks.has(track):
					SaveManager.data.unlocked_tracks.append(track)
	SaveManager.save_data()
