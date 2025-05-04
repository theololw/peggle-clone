extends Node

var winning = false

func _ready() -> void:
	winning = false
	$bg_music.play()
	$WinScreen.hide()


func reset_round():
	
	# reset streak and temp points
	Global.streak = 0
	Global.temp_points = 0
	Global.sound_points = 0
	
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
	
	# check win state and lose state
	if Global.total_oranges == 0:
		winning = true
		$bg_music.stop()
		$ode_to_joy.play()
		$WinScreen.show()
	if Global.balls < 1:
		print("YOU LOST")
	
func _on_death_pit_body_entered(body: Node2D) -> void:
	
	# give free ball if missed
	if Global.streak == 0:
		Global.balls += 1
		$coin_spin.play()
	
	
	reset_round()
	

func _physics_process(delta: float) -> void:
	
	$balls.text = str(Global.balls)
	$points.text = str(Global.points)
	
	# style points
	$style_meter.value = Global.temp_points * 100 / 1500
	if Global.temp_points * 100 / 1500 > 99:
		$free_ball.play()
		Global.balls += 1
		Global.temp_points = 0
		
	
	if Global.purple_left > 0:
		for peg in get_tree().get_nodes_in_group("peg"):
			var random_number = randi_range(0,100)
			if random_number == 0 and peg.orange != true:
				peg.purple = true
				peg.become_purple()
				Global.purple_left -= 1
	
	if winning:
		$ode_to_joy.volume_db += 0.02
	
	

func _on_button_pressed() -> void:
	var current_scene_name = get_tree().current_scene.name
	
	if current_scene_name == "level1":
		reset_global_vars()
		get_tree().change_scene_to_file("res://level_2.tscn")
	if current_scene_name == "level_2":
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	if current_scene_name == "level_3":
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/level_4.tscn")
	if current_scene_name == "level_4":
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/level_5.tscn")
		
	
	if current_scene_name == "level_5":
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/level_6.tscn")
	if current_scene_name == "level_6":
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/level_7.tscn")
	if current_scene_name == "level_7":
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/level_8.tscn")
	if current_scene_name == "level_8":
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/level_9.tscn")
	if current_scene_name == "level_9":
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/level_10.tscn")

func reset_global_vars():
	Global.orange_assigned_left = 30
	Global.points = 0
	Global.balls = 10
	Global.purple_left = 2


func _on_bucket_area_body_entered(body: Node2D) -> void:
	Global.balls += 1
	$free_ball.play()
	reset_round()
	


func _on_reset_button_pressed() -> void:
	reset_round()

func _on_level_select_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
