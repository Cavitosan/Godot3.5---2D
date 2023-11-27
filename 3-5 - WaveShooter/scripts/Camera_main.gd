extends Camera2D

var screen_shake_start:bool = false
var shake_intensity:int = 0

onready var initial_position: Vector2 = self.global_position #Pegando a posição inicial da camera

func _ready():
	Global.camera = self
	
	pass

func _process(delta):
	
	zoom = lerp(zoom, Vector2(1, 1), 0.3)
	
	if screen_shake_start == true:
		global_position += Vector2(rand_range(-shake_intensity, shake_intensity), rand_range(-shake_intensity, shake_intensity)) * delta
	else:
		global_position = lerp(global_position, Vector2(initial_position), 0.3)
	pass

func screen_shake(intensity, time):
	
	zoom = Vector2(1, 1) - Vector2(intensity * 0.02, intensity * 0.02)
	
	shake_intensity = intensity
	
	$Screen_Shake_Timer.wait_time = time
	$Screen_Shake_Timer.start()
	screen_shake_start = true
	
	pass

func _on_Screen_Shake_Timer_timeout():
	screen_shake_start = false
	pass # Replace with function body.
