extends Node2D

@onready var bat_enemy = $BatEnemy
var enemyDead = false

func _on_button_pressed():
	enemyDead = true
	bat_enemy.play("hurt")


func _on_bat_enemy_animation_finished():
	if enemyDead:
		#tween to bosslocation
		var tween = get_tree().create_tween()
		tween.tween_property(bat_enemy, "rotation_degrees", -180.0, 1).as_relative()
		tween.tween_callback(fall)

func fall():
	var anotherTween = get_tree().create_tween()
	anotherTween.tween_property(bat_enemy, "position", Vector2(629, 1000), 5)
