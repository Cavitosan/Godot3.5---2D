extends RigidBody2D

export var min_speed = 150
export var max_speed = 250

func _ready():
	randomize()
	$AnimatedSprite.playing = true
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
