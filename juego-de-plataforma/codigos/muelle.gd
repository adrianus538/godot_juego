extends AnimatedSprite2D
@export var fuersa_inpulso:float = 600
@onready var muelle_play: AudioStreamPlayer2D = $muelle_play

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.aplicar_inpulso_hacia_arriva(fuersa_inpulso)
	play("activado")
	muelle_play.play()
