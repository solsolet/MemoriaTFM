extends Button
class_name StatCard

const DETAIL_POPUP_SCENE = preload("res://scenes/common/detail_popup/detail_popup.tscn")

var stat_id: String = ""

@export var icon_rect: TextureRect
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
	icon_rect.texture = def.icon
	level_label.text = "Lv %d" % StatManager.get_level(stat_id)
	var maxed := def.max_level >= 0 and StatManager.get_level(stat_id) >= def.max_level
	cost_label.text = "MAX" if maxed else "%s N" % NumberFormat.format(StatManager.get_cost(stat_id))
	disabled = not StatManager.can_purchase(stat_id)


func _on_pressed() -> void:
	AudioManager.play_ui_click()
	StatManager.purchase(stat_id)

func _on_info_button_pressed() -> void:
	AudioManager.play_ui_click()
	var def := StatManager.get_definition(stat_id)
	var popup := DETAIL_POPUP_SCENE.instantiate() as DetailPopup
	get_tree().root.add_child(popup)
	popup.setup(def.display_name, def.description)
