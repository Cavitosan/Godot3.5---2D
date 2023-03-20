extends Node2D

const PRE_LAZER = preload("res://scenes/Laser.tscn")
#var screen_size = Vector2.ZERO

export var velocity = 100.0
var escudo = 100.0
onready var escudo_size = $escudo/Sprite.material.get_shader_param("size") #onready = var que precisa de valor assim que começa o jogo
onready var shape_size = $area/shape.shape.radius

export (NodePath) var lazeres

func _ready():
	if lazeres:
		lazeres = get_node(lazeres)
	else:
		lazeres = get_parent()
	
	pass

func _process(delta): #executado 60 vezes por segundo
	var dirX = 0
	var dirY = 0
	#movimentação da nave
	if Input.is_action_pressed("ui_left"):
		dirX -= 1
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	if Input.is_action_pressed("ui_down"):
		dirY += 1
	if Input.is_action_pressed("ui_up"):
		dirY -= 1
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().get_nodes_in_group("laseres").size() < 6:
			var lazer = PRE_LAZER.instance()
			lazeres.add_child(lazer)
			lazer.global_position = $blaster.global_position
	
	#screen_size = get_viewport_rect().size
	
	translate(Vector2(dirX, dirY) * velocity * delta)
	pass

	global_position.x = clamp(global_position.x, 21, 139) #restringindo a movimentação da nave
	global_position.y = clamp(global_position.y, 24,265)
	#global_position.x = clamp(global_position.x, 0, screen_size.x)
	#global_position.y = clamp(global_position.y, 0, screen_size.y)

func _on_area_area_entered(area):
	
	print(area.collision_layer)
	
	
	if [5].find(area.collision_layer) >= 0: #restringindo o tremido da tela para a camada do asteroide apenas
		
		print(area.collision_layer)
	#if area.collision_layer == 5:
		if area.get_parent().has_method("destroy"):
			area.get_parent().destroy()
			get_tree().call_group("camera", "treme", 2.0)
		#print(escudo_size)
			escudo -= 2.0
			var proporcao = escudo / 100.0
			$area/shape.shape.radius = shape_size * proporcao
			$escudo/Sprite.material.set_shader_param("size", escudo_size * proporcao)
		#print(area)
		#pass # Replace with function body.

func _on_dead_area_area_entered(area):
	#queue_free()
	visible = false
	set_process(false)
	pass # Replace with function body.
