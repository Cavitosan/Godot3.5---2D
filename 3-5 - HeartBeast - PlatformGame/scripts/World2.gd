extends Node

var Player_initial_position: Vector2 = Vector2(128, 32)

var Player: PackedScene = preload("res://scenes/Player.tscn")

func _ready():
	Global.instance_node(Player, Player_initial_position, self) #Instanciando o Player na cena
	pass # Replace with function body.



func _process(delta):
	pass
