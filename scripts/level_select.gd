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

func _on_level_6_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_6.tscn")

func _on_level_7_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_7.tscn")

func _on_level_8_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_8.tscn")

func _on_level_9_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_9.tscn")

func _on_level_10_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_10.tscn")


func _on_level_12_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_11.tscn")

func _on_level_13_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_12.tscn")

func _on_level_14_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_13.tscn")

func _on_level_15_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_14.tscn")

func _on_level_16_pressed() -> void:
	reset_global_vars()
	get_tree().change_scene_to_file("res://scenes/level_15.tscn")

func reset_global_vars():
	Global.orange_assigned_left = 30
	Global.points = 0
	Global.temp_points = 0
	Global.purple_left = 2
	Global.sound_points = 0
	Global.streak = 0
	Global.balls = 10

func _on_right_pressed() -> void:
	$background.position.x -= 800

func _on_left_pressed() -> void:
	$background.position.x += 800
