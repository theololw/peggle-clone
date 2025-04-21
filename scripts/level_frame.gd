extends Node


func _on_death_pit_body_entered(body: Node2D) -> void:
	for ball in get_tree().get_nodes_in_group("Ball"):
		ball.queue_free()
		Global.shot_ready = true
	
	for peg in get_tree().get_nodes_in_group("peg"):
		if peg.hit == true:
			peg.queue_free()
