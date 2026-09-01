extends Button
class_name UpgradeCard

var upgrade_id: String = ""

@export var icon_rect: ColorRect
@export var title_label: Label
@export var level_label: Label
@export var cost_label: Label


func setup(id: String) -> void:
	upgrade_id = id
	refresh()


func refresh() -> void:
	var def := UpgradeManager.get_definition(upgrade_id)
	if def == null:
		return
	title_label.text = def.display_name
	level_label.text = "Lv %d" % UpgradeManager.get_level(upgrade_id)
	var maxed := def.max_level >= 0 and UpgradeManager.get_level(upgrade_id) >= def.max_level
	cost_label.text = "MAX" if maxed else "%s N" % NumberFormat.format(UpgradeManager.get_cost(upgrade_id))
	disabled = not UpgradeManager.can_purchase(upgrade_id)


func _on_pressed() -> void:
	AudioManager.play_ui_click()
	UpgradeManager.purchase(upgrade_id)
