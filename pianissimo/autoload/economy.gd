extends Node
## In-memory currency balance + change notifications
## Delegates persistence to SaveManager

signal notes_changed(new_value: int)

var notes: int:
	get: return SaveManager.data.notes

func add(amount: int) -> void:
	if amount <= 0:
		return
	SaveManager.data.notes += amount
	SaveManager.data.total_notes_earned += amount
	notes_changed.emit(SaveManager.data.notes)

func spend(amount: int) -> bool:
	if amount <= 0 or SaveManager.data.notes < amount:
		return false
	SaveManager.data.notes -= amount
	notes_changed.emit(SaveManager.data.notes)
	return true

func can_afford(amount: int) -> bool:
	return SaveManager.data.notes >= amount
