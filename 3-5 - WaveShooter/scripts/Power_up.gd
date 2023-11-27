extends Sprite


export var player_variable_modify: String
export var player_variable_set: float
export var power_up_cool_down: int = 2
export var reload_time: float = 0.05

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player"):
		
		area.get_parent().reload_speed = reload_time
		area.get_parent().get_node("Power_up_cool_down").wait_time = power_up_cool_down
		area.get_parent().get_node("Power_up_cool_down").start()
		area.get_parent().power_up_reset.append(self.name)
		queue_free()
		
		
		"""
		area.get_parent().set(player_variable_modify, player_variable_set)
		area.get_parent().get_node("Power_up_cool_down").wait_time = power_up_cool_down
		area.get_parent().get_node("Power_up_cool_down").start()
		area.get_parent().power_up_reset.append(self.name)
		queue_free()
		"""
		
	pass #Replace with function body.
