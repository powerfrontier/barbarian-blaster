extends PathFollow3D

@export var speed: float = 4.5
@export var max_health: int = 50
@export var gold_earned_per_barbarian: int = 15

var current_health: int:
	set(health):
		if health < current_health:
			animation_player.play("TakeDamage")
		current_health = health
		if current_health < 1:
			bank.gold += gold_earned_per_barbarian
			queue_free()

@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("bank")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health
	#Engine.time_scale = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1.0:
		base.take_damage()
		queue_free()

