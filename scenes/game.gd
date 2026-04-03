extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")

func _on_finish_area_2d_body_entered(body: Node2D) -> void:
	print('Player Entered: ', body)


func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var car_start_positions = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = car_start_positions.position
	$Objects.add_child(car)
	car.connect("body_entered", go_to_title)

func go_to_title(body):
	print('player-car collision', body)
