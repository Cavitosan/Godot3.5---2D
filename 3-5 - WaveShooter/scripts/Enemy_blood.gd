extends Node2D

var fade: bool = false
var alpha:float = 1.0 # Aqui utilizamos o 1 pois a engine verifica o parâmetro "raw" do modulate

func _ready():
	pass
	
func _process(_delta): #Quando colocamos o underline antes do delta significa que não vamos usá-lo
	
	if fade == true:
		alpha = lerp(alpha, 0, 0.1) # lerp não trabalha com números inteiros
		self.modulate.a = alpha
	
		if alpha < 0.005:
			queue_free()
	
	pass


func _on_Fadeout_timer_timeout():
	fade = true
	
	pass # Replace with function body.
