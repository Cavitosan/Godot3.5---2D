extends "Scroll_Movement.gd"

## Atributos

enum EnemyState{
	LONG_LOG,
	SHORT_LOG
}

var state = EnemyState.LONG_LOG
var speed = Global.global_speed

##criar, no physics_process uma randomização para o state do node

func _ready():
	randomize()
	var anim_num = randi() %2
	if anim_num == 1:
		state = EnemyState.LONG_LOG
		
	else:
		state = EnemyState.SHORT_LOG
		
	pass

func _physics_process(delta):
	move(Global.global_speed)
	
	match state:
		EnemyState.LONG_LOG:
			$Log_Sprite1.play("Log")
			$Short_Log_CollisionPolygon2D2.disabled = true
			$Log_CollisionPolygon2D.disabled = false
		EnemyState.SHORT_LOG:
			$Log_Sprite1.play("Short_logs")
			$Short_Log_CollisionPolygon2D2.disabled = false
			$Log_CollisionPolygon2D.disabled = true
	pass

# função de eliminar o objeto assim que ele sai da tela
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print("log morreu")
	pass # Replace with function body.

# função de eliminar o player e encerrar o jogo assim que ele entra na área de colisão do inimigo
func _on_Loginimigo_Area2D_body_entered(body):
	if body.name == "Player_KinematicBody2D":
		if Global.pontuacao > Global.recorde_pontuacao:
			Global.recorde_pontuacao = Global.pontuacao
		body.queue_free()
		Global.vivo = false
		print("Jogador morreu = " + str(Global.vivo))
		get_tree().change_scene("res://scenes/GUI/GameOver.tscn")
	pass # Replace with function body.
