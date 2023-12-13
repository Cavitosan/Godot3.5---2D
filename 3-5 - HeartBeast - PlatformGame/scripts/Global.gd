extends Node

var Player: PackedScene = preload("res://scenes/Player.tscn")

func _ready():
	
	pass # Replace with function body.

func _process(delta):
	pass

func instance_node(node, location, parent): # Função para instanciar um nó
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
