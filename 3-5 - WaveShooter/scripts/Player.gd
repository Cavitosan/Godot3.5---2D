extends Sprite

var speed: int = 150
var velocity: Vector2 = Vector2()
var bullet = preload("res://scenes/Bullet.tscn")
var can_shoot: bool = true
var is_dead:bool = false
var reload_speed: float = 0.2
var default_reload_speed: float = reload_speed
var damage: int = 1
var default_damage: int = damage

var power_up_reset = []

func _ready():
	Global.player = self
	pass # Replace with function body.


func _process(delta):
	
	velocity.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocity.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	velocity = velocity.normalized()
	
	#Limitando o movimento do player na tela
	global_position.x = clamp(global_position.x, 18, 622)
	global_position.y = clamp(global_position.y, 18, 342)
	
	if is_dead == false:
		global_position += speed * velocity * delta
	
	if Input.is_action_pressed("left_click") and Global.node_creation_parent != null and can_shoot and is_dead == false:
		var bullet_instance = Global.instance_node(bullet, global_position, Global.node_creation_parent)
		bullet_instance.damage = damage
		$Reload_speed.start()
		can_shoot = false
	
	pass


func _exit_tree():
	Global.player = null

func _on_Reload_speed_timeout():
	can_shoot = true
	$Reload_speed.wait_time = reload_speed
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.is_in_group("Enemies"):
		is_dead = true
		visible = false
		Global.save_game()
		yield(get_tree().create_timer(1), "timeout") # Cria o timer e espera 1 segundo para o próximo comando
		get_tree().reload_current_scene()
	
	pass # Replace with function body.


func _on_Power_up_cool_down_timeout():
	if power_up_reset.find("Power_up_reload") != null:
		reload_speed = default_reload_speed
		power_up_reset.erase("Power_up_reload")
	elif power_up_reset.find("Power_up_damage") != null:
		damage = default_damage
		power_up_reset.erase("Power_up_damage")
	
	pass # Replace with function body.
