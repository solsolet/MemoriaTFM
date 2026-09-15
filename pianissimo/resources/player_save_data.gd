extends Resource
class_name PlayerSaveData

# Game
@export var notes: int = 0
@export var upgrade_levels: Dictionary = {} # diccionari pla, IDs
@export var achievements_unlocked: Array[String] = []
@export var last_save_time: int = 0
@export var stat_levels: Dictionary = {}
@export var player_level: int = 1
# Practise
@export var focus_session_mode: int = 0 # enum
@export var focus_history: Array = []
@export var focus_session_in_progress: bool = false
@export var focus_session_start_time: int = 0
@export var focus_session_target_seconds: int = 0
@export var focus_session_title: String = ""
@export var focus_session_description: String = ""
@export var focus_session_tag: String = ""
@export var focus_session_tag_color: Color = Color.TRANSPARENT
@export var focus_success_streak: int = 0
# Unlockables
@export var unlocked_cards: Array[String] = []
@export var unlocked_achievements: Array[String] = []
@export var unlocked_tracks: Array[String] = [] # music
@export var achievements_synced: Array[String] = []
@export var total_notes_earned: int = 0
# Seen
@export var cards_seen_count: int = 0
@export var tutorials_seen: Array[String] = []
