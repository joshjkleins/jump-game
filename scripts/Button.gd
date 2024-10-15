extends Sprite2D

@onready var button = $"."

signal pressed

func _on_area_2d_body_entered(body):
	button.frame = 0
	pressed.emit()
