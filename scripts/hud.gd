extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func update_score(score: int) -> void:
	Global.score = score
	if has_node("ScoreLabel"):
		$ScoreLabel.text = str(score)

func save_run_score(custom_score: int = -1) -> void:
	var final_name := Global.player_name if not Global.player_name.is_empty() else "Player"
	var final_score := custom_score if custom_score >= 0 else Global.score
	if final_score > 0:
		var sw_result: Dictionary = await SilentWolf.Scores.save_score(final_name, final_score).sw_save_score_complete
		print("Saved Score result: ", sw_result)
		
func show_game_over() -> void:
	if has_node("StartButton"):
		$StartButton.hide()
	if has_node("Leaderboard"):
		$Leaderboard.hide()
	if has_node("ScoreLabel"):
		var parsed := int($ScoreLabel.text.replace("Score:", "").strip_edges())
		if parsed > 0:
			Global.score = parsed
	
	await save_run_score()
	
	var tree := get_tree()
	if tree:
		await tree.create_timer(0.5).timeout
		tree.change_scene_to_file("res://scenes/level.tscn")
	
func _on_start_button_pressed() -> void:
	$StartButton.hide()
	$Leaderboard.hide()
	start_game.emit()

func _on_message_timer_timeout() -> void:
	$Message.hide()

func _on_leaderboard_pressed() -> void:
	$StartButton.hide()
	$Leaderboard.hide()
	var leaderboard_scene := preload("res://scenes/leaderboard.tscn").instantiate()
	add_child(leaderboard_scene)
