extends Node2D
const JUMP_VELOCITY = -400.0
@onready var salto_tono: AudioStreamPlayer = $salto_tono
@onready var timer: Timer = $Timer
@onready var time_buffer: Timer = $time_buffer

var jugador:CharacterBody2D = null

var dentro_decoyote_time:bool = false
var estabay_tocando_suelo:bool = false
@export var duracion_coyote_time:float = 0.15

var salto_prgamado__al_tocar_el_suelo:bool = false
@export var duracion_Buffer_salto:float = 0.15

func  _ready() -> void:
	jugador =  get_parent()
	timer.one_shot= true
	timer.timeout.connect(on_time_timeout)
	time_buffer.one_shot = true
	time_buffer.timeout.connect(on_time_buffer_timeout)

func _physics_process(_delta: float) -> void:
		# Handle jump.
	if Input.is_action_just_pressed("saltar"):
		if (jugador.is_on_floor() or dentro_decoyote_time):
			saltar()
		else :
			salto_prgamado__al_tocar_el_suelo = true
			time_buffer.start( duracion_Buffer_salto)
	
	
	if estabay_tocando_suelo and not jugador.is_on_floor() and jugador.get_real_velocity().y >= 0:
		dentro_decoyote_time = true
		timer.start(dentro_decoyote_time)
	
	if not estabay_tocando_suelo and jugador.is_on_floor() and salto_prgamado__al_tocar_el_suelo:
		salto_prgamado__al_tocar_el_suelo = false
		time_buffer.stop()
		saltar()
	
	estabay_tocando_suelo = jugador.is_on_floor()

func on_time_timeout() -> void:
	dentro_decoyote_time = false
	
func on_time_buffer_timeout() -> void:
	dentro_decoyote_time = false

func saltar() -> void:
	jugador.velocity.y = JUMP_VELOCITY
	salto_tono.play()
