extends CanvasLayer
class_name WelcomeBackToast

@onready var panel: PanelContainer = $Panel
@onready var label: Label = $Panel/Label


func show_reward(amount: int) -> void:
	label.text = tr("WELCOME_BACK_REWARD") % amount
	panel.modulate.a = 0.0
	panel.position.y = -120

	var tween := create_tween()
	tween.tween_property(panel, "position:y", 40, 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(panel, "modulate:a", 1.0, 0.3)
	tween.tween_interval(2.5)
	tween.tween_property(panel, "modulate:a", 0.0, 0.4)
	tween.tween_callback(queue_free)
