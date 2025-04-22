extends Node2D

@export var ball = preload("res://scenes/ball.tscn")

func _ready() -> void:
	Global.shot_ready = true

func _on_ghost_ball_cooldown_timeout() -> void:
	spawn_ghost_ball()
	
func spawn_ghost_ball():
	var direction = (get_global_mouse_position() - position).normalized()
	
	if Global.shot_ready:
		# spawn the ghost ball instance
		var ghost_ball_instance = ball.instantiate()
		ghost_ball_instance.ghost_ball = true
		get_parent().add_child(ghost_ball_instance)
		
		
		ghost_ball_instance.position = $shooter/muzzle.global_position
		
		ghost_ball_instance.linear_velocity = direction * 500



func _process(delta: float) -> void:
	# assign oran
	
	if Global.orange_assigned_left > 0:
		for peg in get_tree().get_nodes_in_group("peg"):
			var random_number = randi_range(0,100)
			if random_number == 0:
				peg.orange = true
				peg.become_orange()
				Global.orange_assigned_left -= 1
	
	
	# shooter look at where the mouse is
	$shooter.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot") and Global.shot_ready:
		Global.balls -= 1
		var direction = (get_global_mouse_position() - position).normalized()
	
		var ball_instance = ball.instantiate()
		get_parent().add_child(ball_instance)
		ball_instance.position = $shooter/muzzle.global_position
		
		ball_instance.linear_velocity = direction * 500
		
		Global.shot_ready = false
