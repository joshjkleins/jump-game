extends Area2D

var speed = 400
var direction = Vector2.ZERO
@export var damage: int = 0

func _process(delta):
	position += direction * speed * delta
	
	#figure out logic to remove bullet if it misses boss

func destroy():
	queue_free()
