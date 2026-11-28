extends Control

func _ready() -> void:
	$Submit.pressed.connect(_on_submit_pressed)

func _on_submit_pressed() -> void:
	var line_edit := find_child("LineEdit", true, false) as LineEdit
	var entered_name := line_edit.text.strip_edges() if line_edit else ""
	Global.player_name = entered_name if not entered_name.is_empty() else "Player"
	get_tree().change_scene_to_file("res://scenes/main.tscn")
