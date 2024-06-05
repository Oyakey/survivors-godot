extends CharacterBody2D

const MAX_SPEED = 500.0
const ACCELERATION = 15;
const DECELERATION = 40;
var speed = 0;
var oldDirection = Vector2.UP;

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var magnitude = direction.length()
	var orientation = direction.normalized()
	
	if direction.length() > 1:
		direction = direction.normalized()
		
	if direction.length() > 0:
		speed = move_toward(speed, MAX_SPEED, ACCELERATION)
		oldDirection = direction;
	else:
		speed = move_toward(speed, 0, DECELERATION)
	
	velocity = oldDirection.normalized() * speed
	
	move_and_slide()

	if velocity.length() > .01:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
