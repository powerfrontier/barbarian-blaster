extends Node

signal stop_spawing_enemies

@export var game_lenght: float = 180.0
@export var spawn_time_curve: Curve
@export var enemy_health_curve: Curve

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(game_lenght)

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left/game_lenght)

func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())

func get_enemy_health() -> float:
	return enemy_health_curve.sample(game_progress_ratio())

func _on_timer_timeout():
	stop_spawing_enemies.emit()
