extends GridContainer

var player_list_with_pos = []

func _ready() -> void:
	
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores(0).sw_get_scores_complete
	player_list_with_pos = sort_players_and_add_position(SilentWolf.Scores.scores)
	add_player_to_grid(player_list_with_pos)
	
func add_player_to_grid(player_list):
	var rank_vbox = VBoxContainer.new()
	var name_vbox = VBoxContainer.new()
	var score_vbox = VBoxContainer.new()
	
	for score_data in player_list_with_pos:
		var rank_label = Label.new()
		rank_label.text = str(score_data["ranking"])
		rank_label.show()
		rank_vbox.add_child(rank_label)
	add_child(rank_vbox)
	
	for score_data in player_list_with_pos:
		var name_label = Label.new()
		name_label.text = str(score_data["player_name"])
		name_label.show()
		name_vbox.add_child(name_label)
	add_child(name_vbox)
	
	for score_data in player_list_with_pos:
		var score_label = Label.new()
		score_label.text = str(score_data["score"])
		score_label.show()
		score_vbox.add_child(score_label)
	add_child(score_vbox)

func sort_players_and_add_position(player_list):
	var ranking = 1
	for player in player_list:
		player["ranking"] = ranking
		ranking += 1
		
	return player_list
