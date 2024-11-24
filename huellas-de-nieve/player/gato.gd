extends CharacterBody2D

@export var move_speed: float

func _physics_process(delta):
	var input_axis = Input.get_axis("move_left","move_right")
	velocity.x = input_axis * move_speed
	move_and_slide()
