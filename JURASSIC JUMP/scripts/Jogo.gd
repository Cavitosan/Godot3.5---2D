extends Node


func _ready():
	Global.pontuacao = 0
	$BackgroundMusic.play()
	$Dificuldade_1.start()
	pass


func _on_Dificuldade_1_timeout():
	Global.global_speed += 2
	$Dificuldade_2.start()
	pass # Replace with function body.

func _on_Dificuldade_2_timeout():
	Global.global_speed += 2
	$Dificuldade_3.start()
	pass # Replace with function body.

func _on_Dificuldade_3_timeout():
	Global.global_speed += 2
	$Dificuldade_1.start()
	pass # Replace with function body.
