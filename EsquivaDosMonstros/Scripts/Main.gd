extends Node

export (PackedScene) var mob_scene #PackedScene = variavel tipo cena
var score = 0

func _ready():
	randomize()
	pass

func new_game():
	score = 0
	$HUD.update_score(score)
	
	get_tree().call_group("mobs", "queue_free")
	$Player.start($StartPosition.position)
	
	$StartTimer.start()
	$Music.play()
	$HUD.show_message("Get ready...")
	
	yield($StartTimer, "timeout") #faz uma pausa de acordo com o parâmetro
	$ScoreTimer.start()
	$MobTimer.start()
	

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	#$HUD.show_message("Game Over")
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()

func _on_MobTimer_timeout():
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.unit_offset = randf()
	
	var mob = mob_scene.instance()
	add_child(mob)
	
	mob.position = mob_spawn_location.position
	
	var direction = mob_spawn_location.rotation + PI/ 2
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)
	pass # Replace with function body.


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	pass # Replace with function body.
