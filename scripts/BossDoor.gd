extends Node2D

@onready var animation_player = $AnimationPlayer
var playerRef
signal going_through_door

func _on_area_2d_body_entered(body):
	going_through_door.emit()
	animation_player.play("door_open")
	body.noControlIdle()
	playerRef = body


func _on_area_2d_body_exited(_body):
	playerRef.stopMovingPlayer()
	animation_player.play("door_close")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "door_open":
		playerRef.movePlayer()
	
	if anim_name == "door_close":
		playerRef.inControl = true
