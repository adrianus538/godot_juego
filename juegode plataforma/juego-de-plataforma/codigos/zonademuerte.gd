extends Area2D
@onready var sonido_de_muerte: AudioStreamPlayer = $sonido_de_muerte

@onready var timer: Timer = $Timer




func _on_body_entered(body: Node2D) -> void:
	print("tas muerto")
	Engine.time_scale - 0.5
	body.get_node("CollisionShape2D").queue_free()
	sonido_de_muerte.play()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale - 1
	get_tree().reload_current_scene()
	
	
