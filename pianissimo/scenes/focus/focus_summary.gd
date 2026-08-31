extends Control

@onready var result_label: Label = $SafeArea/VBoxContainer/ResultLabel
@onready var detail_label: Label = $SafeArea/VBoxContainer/DetailLabel
@onready var continue_button: Button = $SafeArea/VBoxContainer/ContinueButton


func _ready() -> void:
	AudioManager.ensure_playlist_playing(["menu1.mp3"])
	
	if FocusManager.last_completed:
		result_label.text = tr("PRACTISE_SUMMARY_COMPLETE")
		var detail = tr("PRACTISE_SUMMARY_COMPLETE_REWARD") % FocusManager.last_reward
		if FocusManager.last_unlocked_card_id != "":
			var def := CardManager.get_definition(FocusManager.last_unlocked_card_id)
			detail += tr("PRACTISE_SUMMARY_COMPLETE_CARD") % def.display_name
		detail_label.text = detail
	else:
		result_label.text = tr("PRACTISE_SUMMARY_FAILED")
		detail_label.text = tr("PRACTISE_SUMMARY_FAILED_DETAIL")
	continue_button.pressed.connect(_on_continue_pressed)


func _on_continue_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file",ScenePaths.HOME)
