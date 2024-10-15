extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

var bullet = preload("res://scenes/bat_boss_projectile.tscn")

# Boss health
var health = 200
var max_health = 200

signal finished_waking
var timer = 0.0
var shooting = false

func _process(delta):
	if shooting:
		timer += delta
		if timer >= 0.5:
			shoot()
			timer = 0.0


func wakeUpBoss():
	animation_player.play("wake")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "wake":
		finished_waking.emit()


func _on_area_2d_area_entered(area):
	takeDamage(area.damage)
	area.destroy()



func takeDamage(damage):
	health -= damage
	print(health)
	if health <= 0:
		queue_free()

func getPos():
	return get_node("AnimatedSprite2D").position

func startShooting():
	shooting = true
	animation_player.play("up_down")

func shoot():
	#instantiate bullet
	var bul = bullet.instantiate()
	bul.speed = 200
	bul.shootDirection(Vector2(-1, 0))
	bul.position = position 
	get_parent().add_child(bul)


func _on_area_2d_body_entered(body):
	body.getHit("left")
