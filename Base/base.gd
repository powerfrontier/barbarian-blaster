extends Node3D

@export var max_health: int = 5

var current_health: int:
	set(health):
		current_health = health
		label_3d.text = str(current_health) + "/" + str(max_health)
		var red: Color = Color.RED
		var white: Color = Color.WHITE
		label_3d.modulate = red.lerp(white, float(current_health)/max_health)
		if current_health < 1:
			get_tree().reload_current_scene()

@onready var label_3d: Label3D = $Label3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health

func take_damage() -> void:
	print("damage taken!")
	current_health -= 1
