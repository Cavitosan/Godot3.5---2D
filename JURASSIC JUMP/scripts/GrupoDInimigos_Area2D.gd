extends "Scroll_Movement.gd"

enum GroupEnemyState{
	GROUP_LONG_LOGS,
	GROUP_SHORT_LOGS
}

var state = GroupEnemyState.GROUP_LONG_LOGS
var speed = Global.global_speed

## criar, no physics_process uma randomização para o state do node

func _ready():
	randomize()
	var anim_num = randi() %2
	if anim_num == 1:
		state = GroupEnemyState.GROUP_LONG_LOGS
		
	else:
		state = GroupEnemyState.GROUP_SHORT_LOGS
		
	pass

func _physics_process(delta):
	move(Global.global_speed)
	
	match state:
		GroupEnemyState.GROUP_LONG_LOGS:
			# Visibilidade dos 3 Logs grandes
			$Logs_Grandes.visible = true
			$Logs_Grandes/Logs_Grandes2.visible = true
			$Logs_Grandes/Logs_Grandes3.visible = true
			# Visibilidade dos 3 Logs pequenos
			$Logs_Pequenos.visible = false
			$Logs_Pequenos/Logs_Pequenos2.visible = false
			$Logs_Pequenos/Logs_Pequenos3.visible = false
			# Colisão
			$Logs_Grandes_Collision_Shape2D.disabled = false
			$Logs_Pequenos_CollisionShape2D.disabled = true
		GroupEnemyState.GROUP_SHORT_LOGS:
			# Visibilidade dos 3 Logs grandes
			$Logs_Grandes.visible = false
			$Logs_Grandes/Logs_Grandes2.visible = false
			$Logs_Grandes/Logs_Grandes3.visible = false
			# Visibilidade dos 3 Logs pequenos
			$Logs_Pequenos.visible = true
			$Logs_Pequenos/Logs_Pequenos2.visible = true
			$Logs_Pequenos/Logs_Pequenos3.visible = true
			# Colisão
			$Logs_Grandes_Collision_Shape2D.disabled = true
			$Logs_Pequenos_CollisionShape2D.disabled = false
	pass

## código de randomização de vetor:
# posicao_y = POSICAO_Y[randi() % POSICAO_Y.sizeof()]
# position.y = posicao_y


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print("Grupo log morreu")
	pass # Replace with function body.


func _on_GrupoDInimigos_Area2D_body_entered(body):
	if body.name == "Player_KinematicBody2D":
		if Global.pontuacao > Global.recorde_pontuacao:
			Global.recorde_pontuacao = Global.pontuacao
		body.queue_free()
		Global.vivo = false
		print("Jogador morreu = " + str(Global.vivo))
		get_tree().change_scene("res://scenes/GUI/GameOver.tscn")
	pass # Replace with function body.
