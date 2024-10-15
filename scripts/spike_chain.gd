extends Node2D

enum SPIKE_TYPE {HALF, FULL}
@export var swingType: SPIKE_TYPE

@onready var animation_player = $AnimationPlayer
@onready var ball = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if swingType == SPIKE_TYPE.HALF:
		animation_player.play("halfSwing")
	else:
		animation_player.play("fullSwing")
	var random_number = randf_range(0.9, 1.1)
	animation_player.speed_scale = random_number

func _on_area_2d_body_entered(body):
	var spikePosition = ball.global_position
	var bodyPos = body.get_global_position()
	if spikePosition.x > bodyPos.x:
		body.getHit("left")
	else:
		body.getHit("right")
