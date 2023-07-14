extends Node2D

export var scroll_speed:float = 6.0

func move(speed):
	self.position.x -= speed
	pass
