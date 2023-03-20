extends Node2D

var opcao = 0
var blinks = 0

func _ready():
	pass

func _process(delta):
	
	if Input.is_action_just_pressed("ui_down"):
		opcao += 1
	
	if Input.is_action_just_pressed("ui_up"):
		opcao -= 1
	
	if opcao < 0:
		opcao = $Itens.get_child_count() - 1
	
	if opcao > $Itens.get_child_count() - 1:
		opcao = 0
	
	if Input.is_action_just_pressed("ui_accept"):
		set_process(false)
		match opcao:
			0:
				$timer_blink.start()
				$cursor_select.play()
				#get_tree().change_scene("res://scenes/Game.tscn")
				pass
			1:
				print("options")
				pass
			2:
				get_tree().quit()
				pass
			
			
	#print(opcao)
	$seta.global_position = $Itens.get_child(opcao).global_position + Vector2(-14, 10)


func _on_timer_blink_timeout():
	
	blinks += 1
	$Itens/start.visible = not $Itens/start.visible #efeito de piscar
	if blinks > 10:
		get_tree().change_scene("res://scenes/Game.tscn")
	pass # Replace with function body.
