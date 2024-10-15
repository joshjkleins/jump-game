extends Node2D


@onready var label = $Label
@export var doorName: String = "door"
@export var levelToLoad: String = "Pathname"

func _ready():
	label.text = doorName

func _on_area_2d_body_entered(body):
	body.canChangeLevel = true
	body.levelToChange = levelToLoad

func _on_area_2d_body_exited(body):
	body.canChangeLevel = false
	body.levelToChange = ""
