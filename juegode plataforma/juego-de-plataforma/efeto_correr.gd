extends Node
@onready var timer: Timer = $Timer

@export var tienpo_velos: int = 5 
@export var material_efeto: Material
const pitch_efeto_powerup_original: bool = 1
@export var pitch_efeto_powerup: float = 2

func  _ready() -> void:
	get_parent().efecto_correr.connect(_on_jugador_efecto_correr)
	timer.timeout.connect(_on_timeout)
	renicio_de_pitch()

 

func _on_jugador_efecto_correr() -> void:
	print("efeto")
	get_parent().deves_correr = true
	get_parent().activar_material(material_efeto)
	Musica.pitch_scale = pitch_efeto_powerup
	print("teporizado " + str(tienpo_velos + timer.time_left))
	timer.start(tienpo_velos + timer.time_left)


func _on_timeout() -> void:
	print("terminado")
	get_parent().deves_correr = false
	get_parent().activar_material(null)
	renicio_de_pitch()


func renicio_de_pitch() -> void:
	Musica.pitch_scale = pitch_efeto_powerup_original
