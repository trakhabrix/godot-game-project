extends Node
@export var attack_drop_scene: PackedScene
@export var mob_scene: PackedScene
@export var arrow_scene: PackedScene
var score
var drop
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

func game_over() -> void:
	$HUD.show_game_over()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$Music.stop()
	$DeathSound.play()
	
func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	get_tree().call_group("mobs", "queue_free")
	$Music.play()

func _on_mob_timer_timeout() -> void:
# Spawn Mob
	var mob = mob_scene.instantiate()

	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	mob.position = mob_spawn_location.global_position

	var mob_direction = mob_spawn_location.rotation + PI / 2
	mob_direction += randf_range(-PI / 4, PI / 4)

	mob.rotation = 0

	var mob_velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = mob_velocity.rotated(mob_direction)

	add_child(mob)
	
#Spawn Arrow
	var arrow = arrow_scene.instantiate()

	var arrow_spawn_location = $MobPath/MobSpawnLocation
	arrow_spawn_location.progress_ratio = randf()

	arrow.position = arrow_spawn_location.global_position

	var arrow_direction = arrow_spawn_location.rotation + PI / 2
	arrow_direction += randf_range(-PI / 4, PI / 4)

	# Point arrow toward its movement direction
	arrow.rotation = arrow_direction

	var arrow_velocity = Vector2(200.0, 0.0)
	arrow.linear_velocity = arrow_velocity.rotated(arrow_direction)

	add_child(arrow)

func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)
	
func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()

func _on_slash_drop_collected() -> void:
	$Player.has_slash_charge = true
	
func spawn_slash_drop():
	var attack_drop = attack_drop_scene.instantiate()
	add_child(attack_drop)

	var screen_size = get_viewport().get_visible_rect().size

	attack_drop.position = Vector2(
		randf_range(50, screen_size.x - 50),
		randf_range(50, screen_size.y - 50)
	)
	attack_drop.collected.connect(_on_slash_drop_collected)

func _on_drop_timer_timeout() -> void:
	spawn_slash_drop()
