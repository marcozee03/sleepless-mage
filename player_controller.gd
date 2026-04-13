extends CharacterBody2D

@export
var speed : float = 300.0
@export
var acceleration : float = 300.0
@export
var deceleration : float = 300.0
@export
var jump_velocity : float = -400.0
@export
var sprite : AnimatedSprite2D
func _enter_tree() -> void:
	add_to_group("player")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if velocity.y <= 0:
			velocity += get_gravity() * delta
		else:
			velocity += get_gravity() * 2 * delta

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		sprite.play("walk")
		if direction < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		velocity.x = move_toward(velocity.x, direction * speed, delta * acceleration)
	else:
		sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, deceleration * delta)

	move_and_slide()
