extends Node
## Loads upgrade definitions, tracks the player's level in each

signal upgrade_purchased(id: String, new_level: int)

@export var definitions: Array[UpgradeDefinition] = []

var _definitions: Dictionary = {} # id -> Upgrade Definitions


func _ready() -> void:
	for def in definitions:
		if def != null and def.id != "":
			_definitions[def.id] = def


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
	return int(round(def.base_cost * pow(def.cost_multiplier, get_level(id))))


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
	AchievementManager.unlock("first_upgrade_purchase")
	if new_level >= 10:
		AchievementManager.unlock("upgrade_level_10")
	return true

# INFO: it works in 3, 5, 8...
func total_passive_rate() -> float:
	var total := 0.0
	for id in _definitions.keys():
		var def: UpgradeDefinition = _definitions[id]
		if def.passive_rate > 0.0:
			total += def.passive_rate * get_level(id)
	return total


func is_unlocked(id: String) -> bool:
	var def := get_definition(id)
	if def == null:
		return false
	if def.requires_upgrade_id != "" and get_level(def.requires_upgrade_id) < def.requires_upgrade_level:
		return false
	if SaveManager.data.total_notes_earned < def.requires_total_notes_earned:
		return false
	return true
