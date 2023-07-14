extends Node


func _ready():
	pass

func _process(delta):
	$Control/Label.text = str(Global.pontuacao) + " PONTOS"
	
	if Global.vivo == false:
		set_process(false) #Parando o contador de pontuação quando o Player morre
	else:
		set_process(true)
	
	
	pass
