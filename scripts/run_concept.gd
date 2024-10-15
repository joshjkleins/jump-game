extends Node2D

@onready var start_position = $StartPosition

func _on_end_portal_body_entered(body):
	body.position = start_position.position
