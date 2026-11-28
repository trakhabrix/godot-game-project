extends Node2D

var score = 0

@onready var score_label: Label = $Control/Score

func _physics_process(delta: float) -> void:
	score_label.text = "Score: " + str(Global.score)
	
func _on_submit_pressed() -> void:
	Global.score = 0
	get_tree().change_scene_to_file("res://scenes/get_player_name.tscn")
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_leaderboard_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/leaderboard.tscn")
