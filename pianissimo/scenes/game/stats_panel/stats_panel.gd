extends Panel
class_name StatsPanel

const STAT_CARD_SCENE = preload("res://scenes/game/stats_panel/stat_card.tscn")

@export var cards_container: HBoxContainer

var _cards: Dictionary = {}

func _ready() -> void:
	for id in StatManager.get_all_ids():
		var card := STAT_CARD_SCENE.instantiate() as StatCard
		cards_container.add_child(card)
		card.setup(id)
		_cards[id] = card

	Economy.notes_changed.connect(_on_notes_changed)
	StatManager.stat_purchased.connect(_on_stat_purchased)


func _on_purchase_requested(id: String) -> void:
	StatManager.purchase(id)

func _on_stat_purchased(id: String, _new_level: int) -> void:
	if _cards.has(id):
		_cards[id].refresh()

func _on_notes_changed(_value: int) -> void:
	for card in _cards.values():
		card.refresh()
