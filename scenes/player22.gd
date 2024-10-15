extends CharacterBody2D


@export var SPEED = 100.0
@export var JUMP_VELOCITY = -300.0
var beingHurt = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	# Add the gravity.
	if not beingHurt:
		if not is_on_floor():
			velocity.y += gravity * delta
			if velocity.y < 0:
				animated_sprite_2d.play("jump")
			else:
				animated_sprite_2d.play("fall")
		else:
			animated_sprite_2d.play("run")
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		velocity.x = 1 * SPEED
		#else:
			#velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()


func hit():
	beingHurt = true
	animated_sprite_2d.play("hurt")


func _on_animated_sprite_2d_animation_finished():
	beingHurt = false
	print('animation done')
