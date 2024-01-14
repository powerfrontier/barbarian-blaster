extends CanvasLayer

func restart() -> void:
	get_tree().reload_current_scene()

func quit() -> void:
	get_tree().quit()
