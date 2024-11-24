extends CharacterBody2D

var collision_shape_2d: CollisionShape2D

# Velocidad de movimiento y gravedad del personaje.
@export_range(10, 1000, 10) var SPEED = 500.0
@export var jump_force = 600.0
@export var gravity = 900.0

# Contador de saltos disponibles.
var jump_count = 0
const MAX_JUMPS = 2 # Número máximo de saltos permitidos.

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
	if Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS:
		velocity.y = -jump_force
		animated_sprite_2d.play("jump")
		jump_count += 1
	
	# Restablecer el contador de saltos cuando el personaje toque el suelo.
	if is_on_floor():
		jump_count = 0
	
	# Aplicar movimiento.
	move_and_slide()

	# Detectar si está cayendo (para animaciones opcionales).
	if velocity.y > 0 and not is_on_floor():
		animated_sprite_2d.play("jump")
