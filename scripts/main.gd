extends Node

@export var ghost_scene: PackedScene
@export var arrow_scene: PackedScene
@export var bat_scene: PackedScene
@export var boss_scene: PackedScene

var elapsed_time = 0
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

func game_over() -> void:
	$HUD.show_game_over()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$BossTimer.stop()
	$Music.stop()
	$DeathSound.play()

func new_game():
	score = 0
	elapsed_time = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$Music.play()
	#Disappear all enemies when starting again
	get_tree().call_group("mob", "queue_free")
	get_tree().call_group("arrows", "queue_free")
	get_tree().call_group("bats", "queue_free")
	get_tree().call_group("boss", "queue_free")

func _on_mob_timer_timeout() -> void:
# Spawn Ghost
	if elapsed_time >= 0:
		# Create a new instance of the Ghost scene
		var ghost = ghost_scene.instantiate()
		
		# Choose a random location on Path2D
		var ghost_spawn_location = $MobPath/MobSpawnLocation
		ghost_spawn_location.progress_ratio = randf()
		
		# Set the ghost's position to the random location
		ghost.position = ghost_spawn_location.global_position
		
		# Get the direction based on the spawn location
		var ghost_direction = ghost_spawn_location.rotation + PI / 2
		
		# Randomly changes the ghost's direction by a small angle
		ghost_direction += randf_range(-PI / 4, PI / 4)

		# Set a random movement speed between 150 and 250
		var ghost_velocity = Vector2(randf_range(150.0, 250.0), 0.0)
		
		# Move the ghost in the calculated direction
		ghost.linear_velocity = ghost_velocity.rotated(ghost_direction)
		
		# Make the ghost rotate
		ghost.angular_velocity = 3.0
		
		# Summon the ghost
		add_child(ghost)
#Spawn Bat
	if elapsed_time >= 10:
		# Create a new instance of the Bat scene
		var bat = bat_scene.instantiate()
		
		# Choose a random location on Path2D
		var bat_spawn_location = $MobPath/MobSpawnLocation
		bat_spawn_location.progress_ratio = randf()
		
		# Set the bat's position to the random location
		bat.position = bat_spawn_location.global_position

		# Choose a random diagonal direction
		var directions = [
			Vector2(1, 1),
			Vector2(-1, 1),
			Vector2(1, -1),
			Vector2(-1, -1)
		]
		# Pick a Random Direction
		var bat_direction = directions.pick_random().normalized()
		
		# Rotate the bat
		bat.rotation = bat_direction.angle()
		
		# Set the Bat's Movement Speed
		var bat_velocity = bat_direction * 200.0
		bat.linear_velocity = bat_velocity
		
		# Summon the bat
		add_child(bat)
	
# Spawn Arrow
	if elapsed_time >= 20:
		# Create a new instance of the Bat scene
		var arrow = arrow_scene.instantiate()
		
		# Choose a random location on Path2D
		var arrow_spawn_location = $MobPath/MobSpawnLocation
		arrow_spawn_location.progress_ratio = randf()
		
		# Set the arrow's position to the random location
		arrow.position = arrow_spawn_location.global_position
		
		# Get the direction based on the spawn location
		var arrow_direction = arrow_spawn_location.rotation + PI / 2
		
		# Rotate the arrow
		arrow.rotation = arrow_direction
		
		# Set the Arrow's Movement Speed
		var arrow_velocity = Vector2(300.0, 0.0)
		
		# Rotate the Movement Direction
		arrow.linear_velocity = arrow_velocity.rotated(arrow_direction)
		
		#Summon the Arrow
		add_child(arrow)
	
func _on_score_timer_timeout() -> void:
	elapsed_time += 1
	score += 1
	$HUD.update_score(score)
	
func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
	$BossTimer.start()

func _on_boss_timer_timeout() -> void:
	if elapsed_time >= 20:
		var boss = boss_scene.instantiate()

		var boss_spawn_location = $BossPath/BossSpawnLocation
		boss_spawn_location.progress_ratio = randf()

		boss.position = boss_spawn_location.global_position

		add_child(boss)
		
		var direction = ( $Player.global_position - boss.global_position).normalized()
		
		boss.linear_velocity = direction * 200
