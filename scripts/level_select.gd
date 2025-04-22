extends Node2D



func _on_button_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_button_2_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://level_2.tscn")


func _on_button_3_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")


func _on_button_4_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_4.tscn")


func _on_button_5_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_5.tscn")

func reset_global_vars():
	Global.orange_assigned_left = 30
	Global.points = 0
	Global.temp_points = 0
	Global.purple_left = 2
	Global.sound_points = 0
	Global.streak = 0
	Global.balls = 12
