extends RigidBody2D

@export var speed = 70

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()
	player = get_tree().get_first_node_in_group("player")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	
func _physics_process(delta: float) -> void:
	if player:
		var direction = (player.global_position - global_position).normalized()
		linear_velocity = direction * speed
