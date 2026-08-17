extends Resource
class_name PlayerSaveData

# Game
@export var notes: int = 0
@export var upgrade_levels: Dictionary = {} # diccionari pla, IDs
@export var achievements_unlocked: Array[String] = []
@export var last_save_time: int = 0
@export var stat_levels: Dictionary = {}
# Practise
@export var focus_history: Array = []
@export var focus_session_in_progress: bool = false
@export var focus_session_start_time: int = 0
@export var focus_session_target_seconds: int = 0
@export var focus_session_title: String = ""
@export var focus_session_description: String = ""

@export var unlocked_cards: Array[String] = []
