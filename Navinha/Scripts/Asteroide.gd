extends Node2D

var chosen = 0
var hp = 0
onready var veloc_y = rand_range(30, 150)
onready var veloc_x = rand_range(-40, 40)
var knockback = 0

signal destroied(node)

var hps = [
	1, 
	1, 
	3, 
	2, 
	2	
]

func _ready():
	randomize()
	for a in $Asteroides.get_children():
		a.visible = false #tornamos todos os asteroides invisiveis
	
	if not chosen:
		chosen = randi() % $Asteroides.get_child_count() + 1
	
	hp = hps[chosen - 1]
	
	var node = get_node("Asteroides/Asteroid-" + str(chosen)) #.visible = true #tornamos um dos asteroides visivel
	node.visible = true
	
	$Area/Shape.shape.radius = node.texture.get_width() / 2
	
	pass

func _process(delta):
	translate(Vector2(veloc_x, veloc_y - knockback) * delta)
	
	if global_position.x > 200:
		global_position.x = -40 #realocando o asteroide para o outro canto da tela
	if global_position.x < -40:
		global_position.x = 200
	
	if global_position.y > 300:
		global_position.y = 0
		#queue_free()
		#print("asteroide morreu")
	
	if knockback:
		knockback = lerp(knockback, 0.0, 0.1)
	
	pass

func _on_Area_area_entered(area):
	hp -= 1
	knockback = 120
	$meteor_hit.play()
	if not hp:
		destroy()
		#get_tree().call_group("camera", "treme", 1)
		#emit_signal("destroied", self)
		#queue_free()
		#pass # Replace with function body.
	else:
		get_tree().call_group("camera", "treme", .5)

func destroy():
	get_tree().call_group("camera", "treme", 1)
	emit_signal("destroied", self)
	queue_free()

func get_hp_inicial():
	return hps[chosen - 1]
