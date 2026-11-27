extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  SilentWolf.configure({
	"api_key": "Nk2vPLmR2r8TUHHGhz4Iz5tfyn4vV3Nk2n8zkxsl",
	"game_id": "wackodungeon",
	"log_level": 1
  })

  SilentWolf.configure_scores({
	"open_scene_on_close": "res://scenes/MainPage.tscn"
  })
