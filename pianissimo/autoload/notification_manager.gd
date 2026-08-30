extends Node

const CHANNEL_ID := "daily_reminder"
const NOTIFICATION_ID := 1
const REMINDER_DELAY_SECONDS := 30#24 * 60 * 60  # fires 24h after you leave, cancelled if you return sooner

@onready var scheduler: NotificationScheduler = $NotificationScheduler


func _ready() -> void:
	scheduler.initialization_completed.connect(_on_initialized)
	scheduler.post_notifications_permission_granted.connect(func(_n): print("NotificationManager: permission granted"))
	scheduler.post_notifications_permission_denied.connect(func(_n): print("NotificationManager: permission denied"))
	scheduler.initialize()


func _on_initialized() -> void:
	if not scheduler.has_post_notifications_permission():
		scheduler.request_post_notifications_permission()
	scheduler.create_notification_channel(
		NotificationChannel.new()
			.set_id(CHANNEL_ID)
			.set_name("Reminders")
			.set_description("Reminds you to come back and play")
			.set_importance(NotificationChannel.Importance.DEFAULT)
	)


func schedule_daily_reminder() -> void:
	scheduler.cancel(NOTIFICATION_ID)  # avoid stacking duplicates if called twice
	var data = NotificationData.new() \
		.set_id(NOTIFICATION_ID) \
		.set_channel_id(CHANNEL_ID) \
		.set_title(tr("REMINDER_TITLE")) \
		.set_content(tr("REMINDER_BODY")) \
		.set_delay(REMINDER_DELAY_SECONDS)
	scheduler.schedule(data)


func cancel_daily_reminder() -> void:
	scheduler.cancel(NOTIFICATION_ID)


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_PAUSED, NOTIFICATION_WM_CLOSE_REQUEST:
			schedule_daily_reminder()
		NOTIFICATION_APPLICATION_RESUMED:
			cancel_daily_reminder()
