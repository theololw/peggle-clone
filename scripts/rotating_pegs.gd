extends Node2D

func _physics_process(delta: float) -> void:
	rotate(0.5*delta)
