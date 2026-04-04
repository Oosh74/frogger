extends Area2D

var direction := Vector2.LEFT
var speed := 100

const GREEN = preload("uid://d0dya2slufckd")
const RED = preload("uid://ocjfhrelwysu")
const YELLOW = preload("uid://ded8huv3lr1a7")


const CARS = [GREEN, RED, YELLOW]

func _ready() -> void:
	var random_car_num = randi_range(0, CARS.size()-1)
	$Sprite2D.texture = CARS[random_car_num]
	if position.x < 0:
		direction.x = 1
		$Sprite2D.flip_h = true

#Since we don't actually have collisions, we use regular process
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
