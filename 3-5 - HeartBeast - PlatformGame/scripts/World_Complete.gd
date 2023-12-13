extends Area2D

#World1_Comlete == Portal para passar de nível

export (String, FILE, "*tscn") var next_world

func _ready():
	pass # Replace with function body.



func _process(delta): # No tutorial ele usa o _physics_process
	var bodies = get_overlapping_bodies()
	print(bodies)
	
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(next_world)
	pass
