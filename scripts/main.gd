extends Node

@export var ghost_scene: PackedScene
@export var arrow_scene: PackedScene
@export var bat_scene: PackedScene

var elapsed_time = 0
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func game_over() -> void:
	$HUD.show_game_over()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$Music.stop()
	$DeathSound.play()

	
func new_game():
	score = 0
	elapsed_time = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready!")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$Music.play()
	#Disappear all enemies when starting again
	get_tree().call_group("mob", "queue_free")
	get_tree().call_group("arrows", "queue_free")
	get_tree().call_group("bats", "queue_free")

func _on_mob_timer_timeout() -> void:
# Spawn Ghost
	if elapsed_time >= 0:
		var ghost = ghost_scene.instantiate()

		var ghost_spawn_location = $MobPath/MobSpawnLocation
		ghost_spawn_location.progress_ratio = randf()

		ghost.position = ghost_spawn_location.global_position

		var ghost_direction = ghost_spawn_location.rotation + PI / 2
		ghost_direction += randf_range(-PI / 4, PI / 4)

		ghost.rotation = 0

		var ghost_velocity = Vector2(randf_range(150.0, 250.0), 0.0)
		ghost.linear_velocity = ghost_velocity.rotated(ghost_direction)
		
		ghost.angular_velocity = 3.0
		
		add_child(ghost)
#Spawn Bat
	if elapsed_time >= 10:
		var bat = bat_scene.instantiate()
		var bat_spawn_location = $MobPath/MobSpawnLocation
		bat_spawn_location.progress_ratio = randf()

		bat.position = bat_spawn_location.global_position

		# Choose a random diagonal direction
		var directions = [
			Vector2(1, 1),
			Vector2(-1, 1),
			Vector2(1, -1),
			Vector2(-1, -1)
		]

		var bat_direction = directions.pick_random().normalized()

		bat.rotation = bat_direction.angle()

		var bat_velocity = bat_direction * 200.0
		bat.linear_velocity = bat_velocity
		add_child(bat)
	
# Spawn Arrow
	if elapsed_time >= 20:
		var arrow = arrow_scene.instantiate()

		var arrow_spawn_location = $MobPath/MobSpawnLocation
		arrow_spawn_location.progress_ratio = randf()

		arrow.position = arrow_spawn_location.global_position

		var arrow_direction = arrow_spawn_location.rotation + PI / 2

		arrow.rotation = arrow_direction

		var arrow_velocity = Vector2(300.0, 0.0)
		arrow.linear_velocity = arrow_velocity.rotated(arrow_direction)
		
		add_child(arrow)
	
func _on_score_timer_timeout() -> void:
	elapsed_time += 1
	score += 1
	$HUD.update_score(score)
	
func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
