extends Area3D

@export var speed: float = 20.0
var direction: Vector3 = Vector3.FORWARD

func _physics_process(delta) -> void:
	position += direction * speed * delta

func _on_timer_timeout():
	queue_free()

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		#print(area)
		area.get_parent().current_health -= 25
		queue_free()
