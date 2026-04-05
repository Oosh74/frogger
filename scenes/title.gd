extends Control


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed('Print'):
		call_deferred('play_game')

func play_game():
	get_tree().change_scene_to_file("uid://r8e5vdmp0k17")
