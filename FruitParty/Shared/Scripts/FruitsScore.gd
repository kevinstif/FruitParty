extends Control
@onready var fruitsLabel = $Label2

func update(quantity):
	fruitsLabel.text = str(quantity)
