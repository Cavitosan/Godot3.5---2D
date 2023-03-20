extends CanvasLayer

var score = 0

func _ready():
	pass

func _process(delta):

	pass

func asteroide_destroied(asteroide):
	var pontos = (6 - asteroide.chosen) * 10
	score += pontos
	$score.text = str(score)
	pass

