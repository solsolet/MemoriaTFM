extends Resource
class_name StatDefinition

@export var id: String = ""
@export var display_name: String = ""
@export var base_cost: int = 50
@export var cost_multiplier: float = 1.3 # exponencial, més costós que les upgrades
@export var max_level: int = -1
