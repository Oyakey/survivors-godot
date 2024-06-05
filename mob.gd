extends CharacterBody2D


const SPEED = 300.0
@onready var player = get_node("/root/Game/Player")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	
	velocity = direction * SPEED

	move_and_slide()

	if (velocity.length() > 0):
		$Slime.play_walk()
