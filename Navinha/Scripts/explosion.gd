extends Node2D


func _ready():
	$particles.emitting = true
	$sparks.emitting = true
	pass

func _process(delta):
	if not $particles.emitting and not $sparks.emitting:
		#print("particulas destruidas")
		queue_free()
