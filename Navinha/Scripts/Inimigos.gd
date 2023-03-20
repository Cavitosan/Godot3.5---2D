extends Node2D

const PRE_ASTEROID = preload("res://scenes/Asteroide.tscn")
const PRE_EXPLOSION = preload("res://scenes/explosion.tscn")
const PRE_CRISTAL = preload("res://scenes/cristal.tscn")

var tempo1 = 1.0
var tempo2 = 1.5

func _ready():
	restartTimer()
	pass

func _process(delta):
	
	pass

func _on_spawn_timer_timeout():
	var asteroide = create_asteroide()
	#asteroide.connect("destroied", self, "on_asteroide_destroied") #nome da funcao
	add_child(asteroide)
	asteroide.global_position = Vector2(rand_range(0, 160), -60)
	restartTimer()
	pass # Replace with function body.

#colocar queue_free nos asteroides que sairem da tela

func restartTimer():
	$spawn_timer.wait_time = rand_range(tempo1, tempo2)
	$spawn_timer.start()

func on_asteroide_destroied(asteroide):
	if asteroide.chosen >= 3:
		for i in range((randi() % 2) +1):
			var new_asteroide = create_asteroide()
			new_asteroide.chosen = (randi() % 2) + 1
			add_child(new_asteroide)
			new_asteroide.global_position = asteroide.global_position
			print(asteroide) #asteroide destruído
		
	get_tree().call_group("hud", "asteroide_destroied", asteroide)
	
	var explosion = PRE_EXPLOSION.instance()
	add_child(explosion)
	explosion.global_position = asteroide.global_position
	
	for a in range (asteroide.get_hp_inicial() + 1): #cria cristais de acordo com o hp do asteroide
		var c = PRE_CRISTAL.instance() #instanciar cristal na cena
		add_child(c)
		c.global_position = asteroide.global_position 
		pass
		
	
func create_asteroide():
	var asteroide = PRE_ASTEROID.instance()
	asteroide.connect("destroied", self, "on_asteroide_destroied") #nome da funcao
	return asteroide


func _on_aumenta_dificuldade_timeout():
	tempo1 = 0.5
	tempo2 = 0.8
	pass # Replace with function body.
