extends Node

var player_name : String = ""
var player_lost : Array = []
var score : int = 0

func _ready() -> void:

  SilentWolf.configure({
	"api_key": "alR4OXEAjD8fFhKmmjaWW1dc4LoxanZW6m2UQNQt",
	"game_id": "leaderboardboothgame",
	"log_level": 1
  })
