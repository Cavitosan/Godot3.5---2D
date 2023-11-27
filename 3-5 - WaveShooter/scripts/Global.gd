extends Node

var node_creation_parent = null
var player = null
var points:int = 0
var camera = null
var highscore:int = 0

# var save_game_local_desktop: String = "user://Desktop/savegame.save"
var save_game_local: String = "user://savegame.save"

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance

func save():
	var save_dict = {
		"highscore": highscore
	}
	return save_dict

func save_game():
	var save_game = File.new()
	save_game.open(save_game_local, File.WRITE)
	save_game.store_line(to_json(save()))
	save_game.close()
	
"""
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		print("Error! No save file to load")
		return
	save_game.open("user://savegame.save", File.READ)
	
	var current_line = parse_json(save_game.get_line())
	
	highscore = current_line["highscore"]
	save_game.close()
	pass

"""

func load_game(): #CHATGPT
	var save_game = File.new()
	if not save_game.file_exists(save_game_local):
		print("Error! No save file to load")
		return
	save_game.open(save_game_local, File.READ)
	
	# Verifica se o arquivo não está vazio antes de tentar ler a linha
	if save_game.eof_reached():
		print("Error! Save file is empty")
		save_game.close()
		return
	
	var current_line = parse_json(save_game.get_line())
	
	# Verifica se 'highscore' está presente no dicionário antes de acessá-lo
	if "highscore" in current_line:
		highscore = current_line["highscore"]
	else:
		print("Error! 'highscore' key not found in save file")
	
	save_game.close()
	pass
