extends Resource
class_name CardDefinition

enum Category { COMPOSER, INSTRUMENT, FACT }

@export var id: String = ""
@export var display_name: String = ""
@export var category: Category = Category.COMPOSER
@export var description: String = ""
