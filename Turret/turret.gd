extends Node3D

@export var projectile: PackedScene

var enemy_path: Path3D

@onready var barrel = $TurretBase/TurretTop/Visor/Barrel

func _physics_process(delta) -> void:
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)

func _on_timer_timeout():
	var new_projectile = projectile.instantiate()
	add_child(new_projectile)
	new_projectile.global_position = barrel.global_position
	new_projectile.direction = global_transform.basis.z
	
