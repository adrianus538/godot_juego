extends CanvasLayer
@onready var contador_monedas: Label = $"contador monedas"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	var game_manager = get_node("%gamemaneger")
	game_manager.putuacion_actualizada.connect(_on_putuacion_actualizada)

func _on_putuacion_actualizada(putuacion_actual:int) -> void:
	contador_monedas.text = str(putuacion_actual)
