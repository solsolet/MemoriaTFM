extends HBoxContainer
class_name UpgradeRow

signal purchase_requested(id: String)

var upgrade_id: String = ""

@onready var button: Button = $Button
@onready var label: Label = $Label


func setup(id: String) -> void:
	upgrade_id = id
	refresh()


func refresh() -> void:
	var def := UpgradeManager.get_definition(upgrade_id)
	if def == null:
		return
	label.text = "%s Lv %d  Cost: %d" % [def.display_name, UpgradeManager.get_level(upgrade_id), UpgradeManager.get_cost(upgrade_id)]
	button.disabled = not UpgradeManager.can_purchase(upgrade_id)


func _on_button_pressed() -> void:
	purchase_requested.emit(upgrade_id)
