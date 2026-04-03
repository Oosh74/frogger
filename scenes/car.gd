extends Area2D

var direction := Vector2.LEFT
var speed := 100

#Since we don't actually have collisions, we use regular process
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
