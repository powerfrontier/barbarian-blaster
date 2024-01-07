extends Node3D

@export var turret: PackedScene


func build_turret(turret_position: Vector3) -> void:
	var new_turret = turret.instantiate()
	new_turret.global_position = turret_position
	add_child(new_turret)
