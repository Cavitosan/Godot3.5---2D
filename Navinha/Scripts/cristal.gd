extends Node2D

var vel = 0.0
var dir = Vector2()
var rot = 0.0
var target = null
var frame = 0
var morto = false

func _ready():
	randomize()
	var frames = $sprite.hframes * $sprite.vframes #quantidade total de frames
	$sprite.frame = randi() % frames
	
	vel = rand_range(10 , 30)
	dir = Vector2(rand_range(-1 , 1), rand_range(-1 , 1))
	rot = rand_range(-10 , 10)
	
	$trail.set_as_toplevel(true)

func _process(delta):
	frame += 1
	if not morto:
		
		if target:
			translate(global_position.direction_to(target.global_position) * 200 * delta)
			$trail.set_point_position($trail.get_point_count() - 1, global_position)
			if frame % 6 == 0: #limitando a criação de pontos pela quantidade de frames
				$trail.add_point(global_position) #adicionando trails
		else:
			translate(dir * vel * delta)
		rotate(rot * delta)
	else:
		if frame % 2 == 0:
			$trail.remove_point(0)
		if $trail.get_point_count() == 0:
			
			queue_free() #mata o cristal
	#rotation = vel.angle()
	#rotation += rot * delta
	#rotation += rot * delta
	

	
func _on_area_area_entered(area):
	$sprite.queue_free()
	$area.queue_free()
	$get_crystal.play()
	morto = true
	
	
	pass # Replace with function body.


func _on_timer_timeout():
	var players = get_tree().get_nodes_in_group("player")
	if players.size():
		target = (players[0])
		$trail.add_point(global_position) #adicionando trails
	#pass # Replace with function body.
