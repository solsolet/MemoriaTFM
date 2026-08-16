extends PanelContainer
class_name CardTile

@onready var icon_rect: ColorRect = $VBoxContainer/IconRect
@onready var title_label: Label = $VBoxContainer/TitleLabel
@onready var desc_label: Label = $VBoxContainer/DescLabel

func setup(def: CardDefinition, unlocked: bool) -> void:
	if unlocked:
		title_label.text = def.display_name
		desc_label.text = def.description
		icon_rect.color = _category_color(def.category)
	else:
		title_label.text = "???"
		desc_label.text = "Complete a focus session to discover this card."
		icon_rect.color = Color(0.2, 0.2, 0.2, 1)

func _category_color(category: int) -> Color:
	match category:
		CardDefinition.Category.COMPOSER:
			return Color(0.72, 0.32, 0.32, 1)
		CardDefinition.Category.INSTRUMENT:
			return Color(0.32, 0.5, 0.72, 1)
		CardDefinition.Category.FACT:
			return Color(0.4, 0.68, 0.42, 1)
		_:
			return Color(0.5, 0.5, 0.5, 1)
