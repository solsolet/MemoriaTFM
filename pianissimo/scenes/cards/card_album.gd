extends Control

const CARD_TILE_SCENE = preload("res://scenes/cards/card_tile.tscn")

@onready var grid: GridContainer = $SafeArea/VBoxContainer/ScrollContainer/Grid


func _ready() -> void:
	_populate()


func _populate() -> void:
	for child in grid.get_children():
		child.queue_free()
	for id in CardManager.get_all_ids():
		var def := CardManager.get_definition(id)
		var tile := CARD_TILE_SCENE.instantiate() as CardTile
		grid.add_child(tile)
		tile.setup(def, CardManager.is_unlocked(id))

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(ScenePaths.HOME)
