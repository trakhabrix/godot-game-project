extends Control

func _on_button_pressed() -> void:
	var parent := get_parent()
	if parent and parent.has_node("StartingButton"):
		parent.get_node("StartButton").show()
		parent.get_node("Leaderboard").show()
		queue_free()
	else:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
