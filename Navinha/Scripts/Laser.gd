extends Node2D

var PRE_EXPLOSION = preload("res://scenes/mini_explosion.tscn")

var velocity = 200

func _ready():
	pass


func _process(delta):	
	translate(Vector2(0, -1) * velocity * delta)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	#print("saiu da tela") #asteroide saindo da tela
	queue_free()
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	var e = PRE_EXPLOSION.instance()
	get_parent().add_child(e)
	e.global_position = global_position
	print(Area2D, "Acertou")
	queue_free()
	pass # Replace with function body.
