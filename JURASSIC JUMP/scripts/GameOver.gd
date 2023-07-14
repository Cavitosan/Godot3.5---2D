extends Node


func _ready():
	$Control/Label_pontuacao.text = "YOUR SCORE WAS " + String(Global.pontuacao) + " POINTS!"
	pass


func _on_Button_retry_pressed():
	get_tree().change_scene("res://scenes/Jogo.tscn")
	Global.pontuacao = 0
	Global.vivo = true
	pass # Replace with function body.


func _on_Button_menu_pressed():
	get_tree().change_scene("res://scenes/GUI/Menu.tscn")
	pass # Replace with function body.
