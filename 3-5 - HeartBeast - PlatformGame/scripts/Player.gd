extends KinematicBody2D

const UP:Vector2 = Vector2(0, -1)
const GRAVITY: int = 20
const ACCELERATION:int = 50
const MAX_SPEED: int = 200
const JUMP_HEIGHT:int = -500

var motion: Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	motion.y += GRAVITY
	var friction:bool = false
	
	
	if Input.is_action_pressed("ui_right"):
		# motion.x += ACCELERATION
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED) #Retorna o menor valor entre dois parâmetros
		
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		# motion.x -= ACCELERATION
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
		
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
			
		else:
			$Sprite.play("Fall")
		
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	# A const UP diz à função onde está o chão, que no caso é -1
	motion = move_and_slide(motion, UP)
	
	pass
