extends CanvasLayer
class_name WelcomeBackToast

@onready var panel: PanelContainer = $Panel
@onready var label: Label = $Panel/Label


func show_message(text: String, color: Color = Color("#3A332C")) -> void:
	label.text = text
	label.add_theme_color_override("font_color", color)
	panel.modulate.a = 0.0
	panel.position.y = -120

	var tween := create_tween()
	tween.tween_property(panel, "position:y", 40, 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(panel, "modulate:a", 1.0, 0.3)
	tween.tween_interval(2.5)
	tween.tween_property(panel, "modulate:a", 0.0, 0.4)
	tween.tween_callback(queue_free)

func show_reward(amount: int) -> void:
	show_message(tr("WELCOME_BACK_REWARD") % amount)
