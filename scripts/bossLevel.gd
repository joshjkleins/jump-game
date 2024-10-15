extends Node2D

@onready var bat_boss = $BatBoss
@onready var animation_player = $Camera2D/AnimationPlayer
@onready var boss_location = $BossLocation
@onready var boss_movement = $BatBoss/BossMovement

func _on_boss_door_going_through_door():
	animation_player.play("move_camera")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "move_camera":
		bat_boss.wakeUpBoss()


func _on_bat_boss_finished_waking():
	#tween to bosslocation
	var tween = get_tree().create_tween()
	tween.tween_property(bat_boss, "position", boss_location.position, 3)
	tween.tween_callback(startAttack)

func getBossPos():
	return bat_boss.global_position

func startAttack():
	boss_movement.play("up_down")
	bat_boss.startShooting()
