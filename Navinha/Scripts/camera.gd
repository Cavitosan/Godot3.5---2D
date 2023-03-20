extends Camera2D

onready var time = 1
var forca = 0

func _ready():
	pass

func _process(delta):
	if forca > 0:
		time += delta * 70 #vibracao
		global_position = Vector2(forca,forca).rotated(time) #tive que marcar current = true no inspector para que isso funcionasse
		forca = lerp(forca, 0, .1)

func treme(i):
	forca += i
