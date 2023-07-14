extends Node

func _ready():
	
	pass


func _on_TimerPontuacao_timeout():
	Global.pontuacao += 10
	print(String(Global.pontuacao) + " PONTOS")
	print(String(Global.recorde_pontuacao) + " RECORDE ATUAL")
	pass # Replace with function body.
