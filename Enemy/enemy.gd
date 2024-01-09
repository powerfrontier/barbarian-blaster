extends PathFollow3D

@export var speed: float = 2.5
@export var max_health: int = 50

var current_health: int:
	set(health):
		current_health = health
		#print(current_health)
		if current_health < 1:
			queue_free()

@onready var base = get_tree().get_first_node_in_group("base")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1.0:
		base.take_damage()
		set_process(false) # o también un: queue_free()

