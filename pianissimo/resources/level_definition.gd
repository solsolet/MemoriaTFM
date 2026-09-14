extends Resource
class_name LevelDefinition

@export var level_number: int = 1
@export var era_name: String = ""          # translation key
@export var notes_required: int = 0
@export var stat_investment_required: int = 0  # sum of all stat levels
@export var unlocked_tracks: Array[String] = []  # music filenames added to the playlist
