extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var playerSprite = $PlayerSprite
@onready var animationPlayer = $AnimationPlayer
@onready var fruitsNumber = 0
@onready var healths = 3

func _physics_process(delta):
	
	move(delta)
	move_and_slide()
	
func move(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	animate(direction)

func animate(direction):
	if direction == 1:
		playerSprite.flip_h = false
		animationPlayer.play("walk")
	elif direction == -1:
		playerSprite.flip_h = true
		animationPlayer.play("walk")
	else:
		animationPlayer.play("idle")

func increment_fruits():
	fruitsNumber += 1
	var canvas = get_node("Score")
	canvas.update_fruits_score(fruitsNumber)

func decrement_life():
	healths -= 1
	if healths == 0:
		get_tree().quit()
	var canvas = get_node("Score")
	canvas.update_healt_score(healths)

func increment_timer(time):
	var canvas = get_node("Score")
	canvas.restore_timer(time)

func _on_fruit_detector_body_entered(body):
	if body.get_type() == 'apple':
		increment_fruits()
		body.queue_free()
	if body.get_type() == 'enemy':
		decrement_life()
		body.queue_free()
	if body.get_type() == "bonus":
		increment_timer(30)
		body.queue_free()
		
