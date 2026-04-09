extends Node2D
@onready var timer_label: Label = $CanvasLayer/TimerLabel

var car_scene: PackedScene = preload("res://scenes/car.tscn")
var score: int


func _on_finish_area_2d_body_entered(body: Node2D) -> void:
	if score < Global.score:
		Global.score = score
	if body is CharacterBody2D:
		call_deferred("change_scene")


func change_scene():
	get_tree().change_scene_to_file("uid://c4nuku2axvrrg")


func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var car_start_positions = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = car_start_positions.position
	$Objects.add_child(car)
	car.connect("body_entered", go_to_title)


func go_to_title(body):
	if body is CharacterBody2D:
		call_deferred("change_scene")


func _on_score_timer_timeout() -> void:
	score += 1
	timer_label.text = 'Time Elapsed: ' + str(score)
