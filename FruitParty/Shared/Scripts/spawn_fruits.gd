extends Area2D

@onready var fruitScene = load("res://Shared/Scenes/apple.tscn")
@onready var enemyScene = load("res://Shared/Scenes/enemy.tscn")
@onready var bonusScene = load("res://Shared/Scenes/bonus_item.tscn")

var spawnEnable = true
var random = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn()

func spawn():
	if spawnEnable:
		$Cooldown.start()
		spawnEnable = false
		var selector = random.randi_range(1,100)
		if selector < 70:
			spawn_fruits()
		elif selector >= 70 and selector < 95:
			spawn_enemies()
		else:
			spawn_bonus()

func spawn_fruits():
	var fruitInstance = fruitScene.instantiate()
	fruitInstance.position = Vector2(random.randi_range(0,288),0)
	add_child(fruitInstance)

func spawn_enemies():
	var enemyInstance = enemyScene.instantiate()
	enemyInstance.position = Vector2(random.randi_range(0,288),0)
	add_child(enemyInstance)

func spawn_bonus():
	var bonusInstance = bonusScene.instantiate()
	bonusInstance.position = Vector2(random.randi_range(0,288),0)
	add_child(bonusInstance)

func _on_cooldown_timeout():
	spawnEnable = true
