extends Resource
class_name UpgradeDefinition

@export var id: String = ""
@export var display_name: String = ""
@export var base_cost: int = 10
@export var cost_multiplier: float = 1.12 # costarà 1.12 més per nivell, ho farà exponencial
@export var max_level: int = -1  # -1 = unlimited
