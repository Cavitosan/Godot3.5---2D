extends Area2D

signal hit

export var speed = 400
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	pass


func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	if direction.length() > 0:
		direction = direction.normalized() 
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += direction * speed * delta
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if direction.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_h = direction.x < 0
		$AnimatedSprite.flip_v = false
		
	elif direction.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.flip_v = direction.y > 0

func start(new_position):
	position = new_position
	show()
	$CollisionShape2D.disabled = false
	#$CollisionShape2D2.disabled = false
	

func _on_Player_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	#$CollisionShape2D2.set_deferred("disabled", true)
	emit_signal("hit")
	pass # Replace with function body.
