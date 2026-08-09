extends Panel
class_name UpgradePanel

const UPGRADE_ROW_SCENE = preload("res://scenes/game/upgrade_panel/upgrade_row.tscn")

@onready var rows_container: VBoxContainer = $VBoxContainer

var _rows: Dictionary = {}

func _ready() -> void:
	for id in UpgradeManager.get_all_ids():
		var row := UPGRADE_ROW_SCENE.instantiate() as UpgradeRow
		rows_container.add_child(row)
		row.setup(id)
		row.purchase_requested.connect(_on_purchase_requested)
		_rows[id] = row

	Economy.notes_changed.connect(_on_notes_changed)
	UpgradeManager.upgrade_purchased.connect(_on_upgrade_purchased)

func _on_purchase_requested(id: String) -> void:
	UpgradeManager.purchase(id)

func _on_upgrade_purchased(id: String, _new_level: int) -> void:
	if _rows.has(id):
		_rows[id].refresh()

func _on_notes_changed(_value: int) -> void:
	for row in _rows.values():
		row.refresh()
