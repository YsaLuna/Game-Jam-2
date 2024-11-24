extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var area_2d: Area2D = $Area2D

func _ready():
	# Conecta la señal de colisión del nodo Area2D utilizando un Callable
	area_2d.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":  # Cambia "Player" por el nombre exacto del nodo jugador
		queue_free()  # Elimina el item
