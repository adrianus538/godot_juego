extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const RUN = 130.0
const SPEED = 195.0

var deves_correr : bool = false
signal efecto_correr 

func iniciar_efecto_correr() -> void:
	efecto_correr.emit()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("derecha", "izquierdad")
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	if is_on_floor():
		if direction ==0:
			animated_sprite_2d.play("reposo")
		else :
			animated_sprite_2d.play("correr")
	else :
		animated_sprite_2d.play("saltar")
		
	if direction :
		
		velocity.x = direction *  (SPEED if deves_correr or Input.is_action_pressed("correr") else RUN )
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func activar_material(nuevo_material:Material) -> void:
	animated_sprite_2d.material =nuevo_material

func aplicar_inpulso_hacia_arriva(cantidad_de_inpulso : float) -> void:
	velocity.y = -cantidad_de_inpulso
