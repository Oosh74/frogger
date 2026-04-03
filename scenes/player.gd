extends CharacterBody2D

const SPEED := 200
var direction := Vector2.ZERO
@onready var animations: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("Left", "Right", "Up", "Down") 
	#Input.get_vector is a great shorthand for assign vectors to our input map variables
	# Helps replace many if statements and conditional checking
	# And even handles negative and positive movements for us
	handle_movement(direction)
	handle_animation()
	
	if Input.is_action_just_pressed("Print"):
		print("Something")
	
	move_and_slide()


func handle_movement(current_direction):
	velocity = (current_direction * SPEED)
	return velocity

func handle_animation():
	if direction.x != 0:
		animations.play('walk')
		animations.flip_h = direction.x > 0
	elif direction.y < 0:
		animations.play("walk_up")
	elif direction.y > 0:
		animations.play("walk_down")
#		Shorthand way to do above: animations.animation = 'up' if direction.y < 0 else 'down'
	else:
		animations.stop()
		animations.frame = 0
