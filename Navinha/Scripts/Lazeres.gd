extends Node2D


export var shader_veloc = 0.008
export (NodePath) var nave

func _ready():
	if nave:
		nave = get_node(nave)
	else:
		set_process(false)
	pass

func _process(delta):
	global_position.x = (nave.global_position.x - 80) * shader_veloc * -160#Nessa linha o codigo mexe na posição de todos os nós desse objeto
		
	pass
