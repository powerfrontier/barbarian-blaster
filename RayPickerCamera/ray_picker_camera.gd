extends Camera3D

@export var gridmap: GridMap
@export var turret_manager: Node3D

@onready var ray_cast_3d: RayCast3D = $RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100
	ray_cast_3d.force_raycast_update()
	#printt(ray_cast_3d.get_collider(), ray_cast_3d.get_collision_point())
	
	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = gridmap.local_to_map(collision_point)
			#print(cell)
			if gridmap.get_cell_item(cell) == 0:
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
				if Input.is_action_pressed("click"):
					gridmap.set_cell_item(cell, 1)
					var tile_position = gridmap.map_to_local(cell)
					turret_manager.build_turret(tile_position)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
