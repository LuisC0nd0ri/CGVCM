extends CharacterBody2D

const moveSpeed = 25
const maxSpeed = 50
const jumpHeight = -300
const gravity = 15

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

func _physics_process(_delta):
	velocity.y += gravity
	var friction = false

	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		velocity.x = min(velocity.x + moveSpeed, maxSpeed)

	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		velocity.x = max(velocity.x - moveSpeed, -maxSpeed)

	else:
		animationPlayer.play("Idle")
		friction = true

	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = jumpHeight
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.5)
	else:
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.01)

	move_and_slide()
#var SPEED := 120
#var DIRRECCION := 0.0

#func _physics_process(delta):
#	DIRRECCION = Input.get_axis("ui_left", "ui_right")
#	velocity.x = DIRRECCION * SPEED
#	velocity.y += 9.0
#	move_and_slide()
