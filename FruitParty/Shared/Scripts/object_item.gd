extends CharacterBody2D
class_name ObjectItem

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")/32
var type = 'default'

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

func get_type():
	return type
