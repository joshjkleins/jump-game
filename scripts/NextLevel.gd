extends Node2D

# Exported variable to choose the scene in the editor
@export var next_scene: PackedScene


func change_level():
	# Check if the exported scene is set
	if next_scene:
		# Get the current scene and remove it
		var current_scene = get_tree().current_scene
		if current_scene:
			current_scene.queue_free()

		# Instance the next scene and set it as the current scene
		var new_scene = next_scene.instantiate()
		get_tree().root.add_child(new_scene)
		get_tree().current_scene = new_scene
	else:
		print("No scene selected!")

func _on_area_2d_body_entered(body):
	change_level()
