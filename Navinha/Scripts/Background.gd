extends Sprite

var des = 0
export var shader_veloc = 0.008
export (NodePath) var nave# = get_node("../Ship")
export var time = 0.0

func _ready():
	if nave:
		nave = get_node(nave)
	else:
		set_process(false)
	pass

func _process(delta):
	#print(nave)
	#des += delta
	time += delta
	material.set_shader_param("desloc", (nave.global_position.x - 80) * shader_veloc) #mexendo com a velocidade do background
	material.set_shader_param("time", time)
	
	pass
