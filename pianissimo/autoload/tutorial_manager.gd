extends Node

@export var definitions: Array[TutorialDefinition] = []
var _definitions: Dictionary = {}

func _ready() -> void:
	for def in definitions:
		if def != null and def.id != "":
			_definitions[def.id] = def

func get_definition(id: String) -> TutorialDefinition:
	return _definitions.get(id)

func has_been_seen(id: String) -> bool:
	return SaveManager.data.tutorials_seen.has(id)

func mark_seen(id: String) -> void:
	if not SaveManager.data.tutorials_seen.has(id):
		SaveManager.data.tutorials_seen.append(id)
		SaveManager.save_data()
