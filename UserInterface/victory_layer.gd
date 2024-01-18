extends CanvasLayer

@onready var star_1 = %Star1
@onready var star_2 = %Star2
@onready var star_3 = %Star3
@onready var health_label = %HealthLabel
@onready var money_label = %MoneyLabel


func victory() -> void:
	visible = true
	var base = get_tree().get_first_node_in_group("base")
	if base.current_health == base.max_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true
	var bank = get_tree().get_first_node_in_group("bank")
	if bank.gold >= 500:
		star_3.modulate = Color.WHITE
		money_label.visible = true


func restart() -> void:
	get_tree().reload_current_scene()

func quit() -> void:
	get_tree().quit()
