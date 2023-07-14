extends KinematicBody2D

## Script de personagem

## Atributos
var gravidade = 10;
var pulo:int = 290
var posicao = Vector2.ZERO


enum PlayerState{
	IDLE,
	JUMP,
	RUNNING,
	CROUCHING
}

var state = PlayerState.RUNNING;

## Funções
func _ready():
	pass


func _physics_process(delta):
	$AnimatedSprite.flip_h = false
	posicao.y += gravidade
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"): # apertando a tecla espaço
			posicao.y -= pulo
			state = PlayerState.JUMP
			$AudioStreamPlayer2D.play()
			pass
		
	
	if position.y <= 224:
		state = PlayerState.JUMP # Não esqueça, para o personagem pular o seu eixo y diminui
	elif Input.is_action_pressed("ui_down"):
			state = PlayerState.CROUCHING
	else:
		state = PlayerState.RUNNING
	
	posicao = move_and_slide(posicao, Vector2.UP)
	
	match state:
		PlayerState.IDLE: #Parado
			$AnimatedSprite.play("idle")
		PlayerState.JUMP: #Pulando
			$AnimatedSprite.play("jump")
			# Colisões
			$Idle_CollisionShape2D.disabled = false
			$Running_CollisionShape2D2.disabled = true
		PlayerState.RUNNING: #Correndo
			$AnimatedSprite.play("running")
			# Colisões
			$Running_CollisionShape2D2.disabled = false
		PlayerState.CROUCHING: #Abaixando
			$AnimatedSprite.play("down")
	
	


