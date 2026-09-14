extends RefCounted
class_name NumberFormat

const UNITS := ["", "K", "M", "B", "T"]

static func format(value: float, decimals: int = 1) -> String:
	var sign := "-" if value < 0 else ""
	value = abs(value)
	if value < 1000.0:
		return sign + str(int(round(value)))

	var unit_index := 0
	while value >= 1000.0 and unit_index < UNITS.size() - 1:
		value /= 1000.0
		unit_index += 1
	return sign + ("%.*f%s" % [decimals, value, UNITS[unit_index]])
