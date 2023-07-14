extends Node

func _ready():
	$Control/Label_recorde.text = ("Your biggest record is " +  String(Global.recorde_pontuacao)  + " points!")
	pass

func _on_Button_jogo_pressed():
	get_tree().change_scene("res://scenes/Jogo.tscn")
	Global.pontuacao = 0
	Global.vivo = true
	Global.global_speed = 6
	pass # Replace with function body.


func _on_Button_credits_pressed():
	get_tree().change_scene("res://scenes/Creditos.tscn")
	pass # Replace with function body.
