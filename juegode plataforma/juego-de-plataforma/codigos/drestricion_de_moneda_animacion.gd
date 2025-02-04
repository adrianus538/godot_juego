extends Node
@onready var moneda: Area2D = $".."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

@export var distancia: float = 20
@export var duracion: float = 0.5

func _ready() -> void:
	moneda.body_entered.connect(_on_body_entered)
	moneda. auotro_destrucion = false

func _on_body_entered(_body: Node2D) -> void:
	var tween = get_tree().create_tween().bind_node(moneda).set_parallel(true)
	tween.tween_property(moneda,"position",moneda.position + Vector2.UP * distancia, duracion).set_trans(tween.TRANS_BOUNCE).set_ease(tween.EASE_IN)
	tween.tween_property(animated_sprite_2d,"self_modulate", Color(Color.WHITE,0), duracion )
	await tween.finished
	moneda.queue_free()
