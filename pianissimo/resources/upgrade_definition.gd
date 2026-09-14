extends Resource
class_name UpgradeDefinition

@export var id: String = ""
@export var display_name: String = ""
@export var description: String = ""
@export var icon: Texture2D
@export var base_cost: int = 10
@export var cost_multiplier: float = 1.12 # costarà 1.12 més per nivell, ho farà exponencial
@export var max_level: int = -1  # -1 = unlimited
@export var passive_rate: float = 0.0  # notes/sec per levenivelll; 0 = not a passive-income upgrade

@export var requires_upgrade_id: String = ""      # optional: another upgrade's id
@export var requires_upgrade_level: int = 0
@export var requires_total_notes_earned: int = 0  # optional: lifetime-earned milestone
