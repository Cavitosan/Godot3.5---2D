extends Node2D

export (Array, PackedScene) var scenes
var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0

func _ready():
	position = Vector2(534, 215)
	pass

func _on_Timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0, scenes.size() - 1)
	
	#Para mudarmos algum objeto de posição, vamos precisar verificar qual o seu índice por meio da var selected_scene_index
	
	var tmp = scenes[selected_scene_index].instance()
	add_child_below_node(self, tmp)
	
	
	pass # Replace with function body.
