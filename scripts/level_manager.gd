extends Node

const file = "res://scenes/levels/"

func change_level(level):
	# Check if the exported scene is set
	if level:
		var csf = get_tree().current_scene.scene_file_path
		var nlp = file + level + ".tscn"
		print(nlp)
		get_tree().change_scene_to_file(nlp)
	else:
		print("No scene selected!")
