extends Sprite

var velocity: Vector2 = Vector2(1, 0)
var speed: int = 250
var look_once: bool = true
var damage

func _process(delta):
	
	if look_once == true:
		look_at(get_global_mouse_position())
		look_once = false
	
	global_position += velocity.rotated(rotation) * speed * delta
	
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
