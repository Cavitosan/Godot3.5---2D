extends Node2D


func _ready():
	$Timer_horario_tarde.start()
	pass

func _process(delta):
	pass
	
func _on_Timer_horario_tarde_timeout():
	$AnimationPlayer_horario.play("tardecer")
	$Timer_horario_noite.start()
	pass # Replace with function body.


func _on_Timer_horario_noite_timeout():
	$AnimationPlayer_horario.play("anoitecer")
	$Timer_horario_manha.start()
	pass # Replace with function body.


func _on_Timer_horario_manha_timeout():
	$AnimationPlayer_horario.play("amanhecer")
	$Timer_horario_tarde.start()
	pass # Replace with function body.
