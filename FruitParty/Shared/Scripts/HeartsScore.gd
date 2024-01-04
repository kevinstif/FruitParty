extends Control
@onready var healthLabel = $Label4

func update(quantity):
	healthLabel.text = str(quantity)
