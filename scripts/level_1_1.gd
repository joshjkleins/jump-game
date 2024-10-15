extends Node2D

@onready var animation_player = $FallingPlatform/AnimationPlayer
var platformLifted = false

func _on_button_pressed():
	platformLifted = true


func _on_animation_player_animation_finished(anim_name):
	print('finished')
	if platformLifted:
		animation_player.queue("float_higher")
	else:
		animation_player.queue("float")
