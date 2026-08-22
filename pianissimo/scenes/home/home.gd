extends Control

const HOME_BLACK_KEY_LANES := [1, 3, 6, 8, 10]  # C#, D#, F#, G#, A#
const HOME_WHITE_KEY_LANES := [0, 2, 4, 5, 7, 9, 11]  # C, D, E, F, G, A, B

@export var white_keys_column: VBoxContainer
@export var achievements_button: Button
@export var album_badge: Panel
@export var album_badge_label: Label


func _ready() -> void:
	# INFO: Sound
	AudioManager.ensure_playlist_playing(["menu1.mp3"])
	
	for i in white_keys_column.get_child_count():
		white_keys_column.get_child(i).pressed.connect(func(): AudioManager.play_note_hit(HOME_WHITE_KEY_LANES[i])) # BUG: sona Do repe en les dos últimes
	
	achievements_button.pressed.connect(_on_achievements_button_pressed)
	_update_album_badge()


func _update_album_badge() -> void:
	var new_count: int = SaveManager.data.unlocked_cards.size() - SaveManager.data.cards_seen_count
	album_badge.visible = new_count > 0
	if new_count > 0:
		album_badge_label.text = str(new_count)


func _on_idle_button_pressed() -> void:
	AudioManager.play_note_hit(HOME_BLACK_KEY_LANES[0])
	get_tree().call_deferred("change_scene_to_file",ScenePaths.GAME)

func _on_focus_button_pressed() -> void:
	AudioManager.play_note_hit(HOME_BLACK_KEY_LANES[1])
	get_tree().call_deferred("change_scene_to_file",ScenePaths.FOCUS_SETUP)

func _on_settings_button_pressed() -> void:
	AudioManager.play_note_hit(HOME_BLACK_KEY_LANES[2])
	SettingsManager.return_scene_path = ScenePaths.HOME
	get_tree().call_deferred("change_scene_to_file",ScenePaths.SETTINGS)

func _on_achievements_button_pressed() -> void:
	AudioManager.play_note_hit(HOME_BLACK_KEY_LANES[3])
	AchievementManager.show_achievements_ui()

func _on_album_button_pressed() -> void:
	AudioManager.play_note_hit(HOME_BLACK_KEY_LANES[4])
	get_tree().call_deferred("change_scene_to_file",ScenePaths.CARD_ALBUM)
