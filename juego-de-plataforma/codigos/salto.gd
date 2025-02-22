extends Node2D
const JUMP_VELOCITY = -400.0
@onready var salto_tono: AudioStreamPlayer = $salto_tono
@onready var timer: Timer = $Timer

var jugador:CharacterBody2D = null

var dentro_decoyote_time:bool = false
var estabay_tocando_suelo:bool = false
@export var duracion_coyote_time = 0.15

func  _ready() -> void:
	jugador =  get_parent()
	timer.one_shot= true
	timer.timeout.connect(on_time_timeout)

func _physics_process(_delta: float) -> void:
		# Handle jump.
	if Input.is_action_just_pressed("saltar") and (jugador.is_on_floor() or dentro_decoyote_time):
		jugador.velocity.y = JUMP_VELOCITY
		salto_tono.play()
	
	if estabay_tocando_suelo and not jugador.is_on_floor() and jugador.get_real_velocity().y >= 0:
		dentro_decoyote_time = true
		timer.start(dentro_decoyote_time)
	
	estabay_tocando_suelo = jugador.is_on_floor()

func on_time_timeout() -> void:
	dentro_decoyote_time = false
	
