extends Panel
class_name UpgradePanel

const UPGRADE_CARD_SCENE = preload(ScenePaths.UPGRADE_CARD)

@onready var cards_container: HBoxContainer = $VBoxContainer/ScrollContainer/CardsRow

var _cards: Dictionary = {}

func _ready() -> void:
	for id in UpgradeManager.get_all_ids():
		var card := UPGRADE_CARD_SCENE.instantiate() as UpgradeCard
		cards_container.add_child(card)
		card.setup(id)
		_cards[id] = card

	Economy.notes_changed.connect(_on_notes_changed)
	UpgradeManager.upgrade_purchased.connect(_on_upgrade_purchased)

func _on_purchase_requested(id: String) -> void:
	UpgradeManager.purchase(id)

func _on_upgrade_purchased(id: String, _new_level: int) -> void:
	if _cards.has(id):
		_cards[id].refresh()

func _on_notes_changed(_value: int) -> void:
	for card in _cards.values():
		card.refresh()
