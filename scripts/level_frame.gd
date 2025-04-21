extends Node

func _ready() -> void:
	$WinScreen.hide()
func _on_death_pit_body_entered(body: Node2D) -> void:
	for ball in get_tree().get_nodes_in_group("Ball"):
		ball.queue_free()
		Global.shot_ready = true
	
	Global.total_oranges = 0
	for peg in get_tree().get_nodes_in_group("peg"):
		if peg.orange == true:
			Global.total_oranges += 1
	
	for peg in get_tree().get_nodes_in_group("peg"):
		if peg.hit == true:
			if peg.orange == true:
				Global.total_oranges -= 1
			peg.queue_free()
			
	if Global.total_oranges == 0:
		$WinScreen.show()



func _on_button_pressed() -> void:
	if get_tree().current_scene.name == "level1":
		Global.orange_assigned_left = 20
		get_tree().change_scene_to_file("res://level_2.tscn")
