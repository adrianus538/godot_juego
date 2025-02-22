extends Node2D
const  velocidad = 60
var direccion = 1

@onready var ray_cast_derecha: RayCast2D = $RayCast_derecha
@onready var ray_cast_izquierdad: RayCast2D = $RayCast_izquierdad
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_derecha.is_colliding():
		direccion = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_izquierdad.is_colliding():
		direccion = 1
		animated_sprite_2d.flip_h = false
	position.x += direccion*velocidad*delta
