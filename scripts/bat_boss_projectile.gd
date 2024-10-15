extends Area2D

var speed = 400
var direction
@export var damage: int = 0

func _process(delta):
		position += Vector2(-1, 0) * speed * delta
	
	#figure out logic to remove bullet if it misses boss

func destroy():
	queue_free()


func shootDirection(dir):
	direction = dir


func _on_body_entered(body):
	body.getHit("left")
