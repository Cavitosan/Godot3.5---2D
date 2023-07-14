extends "Scroll_Movement.gd"

enum GroupEnemyState{
	GROUP_PTERO,
	GROUP_TRICERA
}

var state = GroupEnemyState.GROUP_PTERO
var speed:int = Global.global_speed

func _ready():
	randomize()
	var anim_num = randi() %2
	if anim_num == 1:
		state = GroupEnemyState.GROUP_PTERO
		
	else:
		state = GroupEnemyState.GROUP_TRICERA
		
	pass


func _physics_process(delta):
	move(Global.global_speed)
	
	match state:
		GroupEnemyState.GROUP_PTERO:
			#Sprites
			$Triceratops.visible = false
			$Pterodactil.visible = true
			$Pterodactil.play("Pterodactil") #colocando a animação para tocar
			#caixas de colisão
			$ColisaoTriceratops.disabled = true
			$ColisaoPterodactil.disabled = false
		GroupEnemyState.GROUP_TRICERA:
			#Sprites
			$Triceratops.visible = true
			$Pterodactil.visible = false
			$Triceratops.play("triceratops") #colocando a animação para tocar
			#Caixas de colisão
			$ColisaoTriceratops.disabled = false
			$ColisaoPterodactil.disabled = true
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print("Grupo dino morreu")
	pass # Replace with function body.


func _on_GrupoDinossauros_body_entered(body):
	if body.name == "Player_KinematicBody2D":
		if Global.pontuacao > Global.recorde_pontuacao:
			Global.recorde_pontuacao = Global.pontuacao
		body.queue_free()
		Global.vivo = false
		print("Jogador morreu = " + str(Global.vivo))
		get_tree().change_scene("res://scenes/GUI/GameOver.tscn")	
	pass # Replace with function body.
