extends CharacterBody2D

# Velocidad de movimiento y gravedad del personaje.
@export_range(10, 1000, 10) var SPEED = 400.0
@export var jump_force = 700.0
@export var gravity = 900.0

# Referencia al nodo que contiene las animaciones del personaje.
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	# Aplicar gravedad.
	velocity.y += gravity * delta

	# Movimiento horizontal.
	if Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		animated_sprite_2d.play("walk")
		animated_sprite_2d.flip_h = true # Voltear horizontalmente.
	elif Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		animated_sprite_2d.play("walk")
		animated_sprite_2d.flip_h = false # Orientación normal.
	else:
		velocity.x = 0
		animated_sprite_2d.play("idle")
	
	# Salto.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		animated_sprite_2d.play("jump")
	
	# Aplicar movimiento (sin asignar el resultado de move_and_slide).
	move_and_slide()

	# Detectar si está cayendo (para animaciones opcionales).
	if velocity.y > 0 and not is_on_floor():
		animated_sprite_2d.play("jump")
