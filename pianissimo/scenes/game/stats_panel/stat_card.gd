extends Button
class_name StatCard

var stat_id: String = ""

@export var icon_rect: ColorRect
@export var title_label: Label
@export var level_label: Label
@export var cost_label: Label


func setup(id: String) -> void:
	stat_id = id
	refresh()


func refresh() -> void:
	var def := StatManager.get_definition(stat_id)
	if def == null:
		return
	title_label.text = def.display_name
	level_label.text = "Lv %d" % StatManager.get_level(stat_id)
	var maxed := def.max_level >= 0 and StatManager.get_level(stat_id) >= def.max_level
	cost_label.text = "MAX" if maxed else "%d notes" % StatManager.get_cost(stat_id)
	disabled = not StatManager.can_purchase(stat_id)

func _on_pressed() -> void:
	AudioManager.play_ui_click()
	StatManager.purchase(stat_id)
