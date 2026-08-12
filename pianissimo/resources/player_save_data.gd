extends Resource
class_name PlayerSaveData

@export var notes: int = 0
@export var upgrade_levels: Dictionary = {} # diccionari pla, IDs
@export var achievements_unlocked: Array[String] = []
@export var last_save_time: int = 0
@export var stat_levels: Dictionary = {}
