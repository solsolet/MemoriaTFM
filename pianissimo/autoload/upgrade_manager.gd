extends Node
## Loads upgrade definitions, tracks the player's level in each

signal upgrade_purchased(id: String, new_level: int)

const UPGRADES_PATH := "res://data/upgrades/"
const DEFINITIONS: Array[UpgradeDefinition] = [
	preload("res://data/upgrades/auto_tap.tres"),
	preload("res://data/upgrades/multiplier.tres"),
]

var _definitions: Dictionary = {} # id -> Upgrade Definitions


func _ready() -> void:
	for def in DEFINITIONS:
		if def != null and def.id != "":
			_definitions[def.id] = def

#func _ready() -> void:
	#_load_definitions()


#func _load_definitions() -> void:
	#var dir := DirAccess.open(UPGRADES_PATH)
	#if dir == null:
		#push_warning("UpgradeManager: could not open %s" % UPGRADES_PATH)
		#return
	#
	#dir.list_dir_begin()
	#var file_name := dir.get_next()
	#while file_name != "":
		#if not dir.current_is_dir() and file_name.ends_with(".tres"):
			#var res := ResourceLoader.load(UPGRADES_PATH + file_name) as UpgradeDefinition
			#if res != null and res.id != "":
				#_definitions[res.id] = res
		#file_name = dir.get_next()
	#dir.list_dir_end()


func get_definition(id: String) -> UpgradeDefinition:
	return _definitions.get(id)


func get_all_ids() -> Array:
	return _definitions.keys()


func get_level(id: String) -> int:
	return int(SaveManager.data.upgrade_levels.get(id, 0))


func get_cost(id: String) -> int:
	var def := get_definition(id)
	if def == null:
		return 0
	return def.base_cost + get_level(id) * def.cost_growth


func can_purchase(id: String) -> bool:
	var def := get_definition(id)
	if def == null:
		return 0
	if def.max_level >= 0 and get_level(id) >= def.max_level:
		return false
	return Economy.can_afford(get_cost(id))


func purchase(id: String) -> bool:
	if not can_purchase(id):
		return false
	if not Economy.spend(get_cost(id)):
		return false
	var new_level := get_level(id) + 1
	SaveManager.data.upgrade_levels[id] = new_level
	SaveManager.save_data()
	upgrade_purchased.emit(id, new_level)
	return true
