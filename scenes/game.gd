extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")
@onready var objects: Node = $Objects

func _on_finish_area_2d_body_entered(body: Node2D) -> void:
	print('Player Entered: ', body)


func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate()
	objects.add_child(car)
