extends Area3D

@export var speed: float = 20.0
var direction: Vector3 = Vector3.FORWARD

func _physics_process(delta) -> void:
	position += direction * speed * delta

func _on_timer_timeout():
	queue_free()
