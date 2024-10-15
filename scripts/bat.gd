extends AnimatedSprite2D

@onready var animation_player = $AnimationPlayer
@onready var bat = $Bat

func _on_area_2d_body_entered(body):
	print("hit")
	body.hit()
	#var batPosition = bat.global_position
	#var bodyPos = body.get_global_position()
	#if batPosition.x > bodyPos.x:
		#body.getHit("left")
	#else:
		#body.getHit("right")
