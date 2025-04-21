extends Node

func _ready() -> void:
	$WinScreen.hide()
func _on_death_pit_body_entered(body: Node2D) -> void:
	
	# reset streak
	Global.streak = 0
	
	# remove all the balls
	for ball in get_tree().get_nodes_in_group("Ball"):
		ball.queue_free()
		Global.shot_ready = true
	
	# add how many oranges left
	Global.total_oranges = 0
	for peg in get_tree().get_nodes_in_group("peg"):
		if peg.orange == true:
			Global.total_oranges += 1
	
	# remove hit pegs
	for peg in get_tree().get_nodes_in_group("peg"):
		if peg.hit == true:
			if peg.orange == true:
				Global.total_oranges -= 1
			peg.queue_free()
	# add purple pegs
	
	Global.purple_left = 2
	for peg in get_tree().get_nodes_in_group("peg"):
		peg.become_unpurple()
	
	
	# check win state
	if Global.total_oranges == 0:
		$WinScreen.show()

func _physics_process(delta: float) -> void:
	
	$points.text = str(Global.points)
	
	if Global.purple_left > 0:
		for peg in get_tree().get_nodes_in_group("peg"):
			var random_number = randi_range(0,100)
			if random_number == 0 and peg.orange != true:
				peg.purple = true
				peg.become_purple()
				Global.purple_left -= 1

func _on_button_pressed() -> void:
	var current_scene_name = get_tree().current_scene.name
	
	if current_scene_name == "level1":
		Global.orange_assigned_left = 30
		get_tree().change_scene_to_file("res://level_2.tscn")
	if current_scene_name == "level2":
		Global.orange_assigned_left = 30
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	if current_scene_name == "level3":
		Global.orange_assigned_left = 30
		get_tree().change_scene_to_file("res://scenes/level_4.tscn")
	if current_scene_name == "level4":
		Global.orange_assigned_left = 30
		get_tree().change_scene_to_file("res://scenes/level_5.tscn")
