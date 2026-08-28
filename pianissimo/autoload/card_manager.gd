extends Node

signal card_unlocked(id: String)

@export var definitions: Array[CardDefinition] = []

var _definitions: Dictionary = {}


func _ready() -> void:
	for def in definitions:
		if def != null and def.id != "":
			_definitions[def.id] = def


func get_definition(id: String) -> CardDefinition:
	return _definitions.get(id)

func get_all_ids() -> Array:
	return _definitions.keys()

func is_unlocked(id: String) -> bool:
	return SaveManager.data.unlocked_cards.has(id)


func unlock_random_card() -> String:
	var locked_ids: Array = []
	for id in _definitions.keys():
		if not is_unlocked(id):
			locked_ids.append(id)
	
	if locked_ids.is_empty():
		return ""
	
	var chosen: String = locked_ids[randi() % locked_ids.size()]
	SaveManager.data.unlocked_cards.append(chosen)
	SaveManager.save_data()
	card_unlocked.emit(chosen)
	
	if SaveManager.data.unlocked_cards.size() >= 10:
		AchievementManager.unlock("ten_cards")
	if SaveManager.data.unlocked_cards.size() >= _definitions.size():
		AchievementManager.unlock("all_cards")

	return chosen
