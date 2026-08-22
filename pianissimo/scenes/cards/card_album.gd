extends Control

const CARD_TILE_SCENE = preload("res://scenes/cards/card_tile.tscn")

@export var grid: GridContainer


func _ready() -> void:
	AudioManager.ensure_playlist_playing(["menu1.mp3"])
	_populate()
	
	SaveManager.data.cards_seen_count = SaveManager.data.unlocked_cards.size() # For the badge count in Home
	SaveManager.save_data()


func _populate() -> void:
	for child in grid.get_children():
		child.queue_free()
	for id in CardManager.get_all_ids():
		var def := CardManager.get_definition(id)
		var tile := CARD_TILE_SCENE.instantiate() as CardTile
		grid.add_child(tile)
		tile.setup(def, CardManager.is_unlocked(id))

func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.HOME)
