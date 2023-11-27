extends Sprite

# Script nuclear para criação de inimigos


var velocity: Vector2 = Vector2()
var stun:bool = false

onready var current_color = modulate

export var speed: int = 75
export var hp: int = 3
export var knockback: int = 500
export var screen_shake: int = 20
export var point_value:int = 10


var blood_particles = preload("res://scenes/Blood_particles.tscn")

func _process(_delta):
	
	if hp <= 0:
		if Global.camera != null:
			Global.camera.screen_shake(screen_shake, 0.1)
		
		Global.points += point_value
		if Global.node_creation_parent != null:
			var blood_particles_instance = Global.instance_node(blood_particles, global_position, Global.node_creation_parent)
			blood_particles_instance.rotation = velocity.angle()
			blood_particles_instance.modulate = Color.from_hsv(current_color.h, 0.75, current_color.v)
		queue_free()	
	
	pass

func basic_movement_towards_player(delta):
	
	if Global.player != null and stun == false:
		velocity = global_position.direction_to(Global.player.global_position)
		global_position += velocity * speed * delta
	elif stun:
		velocity = lerp(velocity, Vector2(0, 0), 0.3) #knockback: a variável velocity será diminuída para 0, 0 na velocidade de 0.3
		global_position += velocity * delta
	pass


func _on_Hitbox_area_entered(area):
	
	if area.is_in_group("Enemy_damager") and stun == false:
		modulate = Color.white
		velocity = -velocity * knockback
		hp -= area.get_parent().damage
		stun = true
		$Stun_timer.start()
		area.get_parent().queue_free()
	
	pass # Replace with function body.

func _on_Stun_timer_timeout():
	modulate = Color(current_color)
	stun = false

	pass # Replace with function body.
