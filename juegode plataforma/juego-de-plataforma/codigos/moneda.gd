extends Area2D
@onready var gamemaneger: Node = %gamemaneger
@onready var monedas: AudioStreamPlayer = $monedas
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var auotro_destrucion: bool = true

func _on_body_entered(_body: Node2D) -> void:
	gamemaneger.incrementa_un_punto()
	monedas.play()
	collision_shape_2d.call_deferred("set","disabled",true)
	
	if auotro_destrucion:
		animated_sprite_2d.visible = false
		monedas.finished.connect(_on_finished)
	
func _on_finished() -> void:
	queue_free()
