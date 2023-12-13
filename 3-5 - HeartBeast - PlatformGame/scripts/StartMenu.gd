extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	pass


func _on_Start_Button_pressed():
	get_tree().change_scene("res://scenes/World.tscn") # mudar de cena
	pass # Replace with function body.


func _on_Quit_Button2_pressed():
	get_tree().quit() #sair do jogo
	pass # Replace with function body.
