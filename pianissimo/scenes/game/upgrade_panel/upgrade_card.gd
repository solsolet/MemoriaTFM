extends Button
class_name UpgradeCard

var upgrade_id: String = ""

@onready var icon_rect: ColorRect = $VBoxContainer/IconRect
@onready var title_label: Label = $VBoxContainer/TitleLabel
@onready var level_label: Label = $VBoxContainer/LevelLabel
@onready var cost_label: Label = $VBoxContainer/CostLabel


func setup(id: String) -> void:
	upgrade_id = id
	refresh()


func refresh() -> void:
	var def := UpgradeManager.get_definition(upgrade_id)
	if def == null:
		return
	title_label.text = def.display_name
	level_label.text = "Lv %d" % UpgradeManager.get_level(upgrade_id)
	cost_label.text = "%d notes" % UpgradeManager.get_cost(upgrade_id)
	disabled = not UpgradeManager.can_purchase(upgrade_id)


func _on_pressed() -> void:
	AudioManager.play_ui_click()
	UpgradeManager.purchase(upgrade_id)
