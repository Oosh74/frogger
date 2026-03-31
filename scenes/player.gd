extends CharacterBody2D

const SPEED := 200
var direction := Vector2.ZERO

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("Left", "Right", "Up", "Down") 
	#Input.get_vector is a great shorthand for assign vectors to our input map variables
	# Helps replace many if statements and conditional checking
	# And even handles negative and positive movements for us
	handle_movement(direction)
	
	if Input.is_action_just_pressed("Print"):
		print("Something")
	
	move_and_slide()


func handle_movement(current_direction):
	velocity = (current_direction * SPEED)
	return velocity
