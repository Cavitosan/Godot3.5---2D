extends Node2D

var tempo = 3

func _ready():
	pass

func _on_Timer_timeout():
	tempo -= 1
	$Label.text = str(tempo)
	print("contando")
	
	if tempo <= 0:
		get_tree().paused = false
		queue_free()
