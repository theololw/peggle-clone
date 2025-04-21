extends RigidBody2D

var ghost_ball : bool

func _ready() -> void:
	if ghost_ball:
		collision_layer &= ~(1 << 1)  # layer 2 = bit 1
		collision_layer |= (1 << 3)   # layer 4 = bit 3
		$Ball.hide()
		$ghost_Ball.hide()
		$CPUParticles2D.show()
		$ghost_ball_timeout.start()
		$Particle_timout.start()
	else:
		$Ball.show()
		$ghost_Ball.hide()
		$CPUParticles2D.hide()
	


func _on_death_pit_body_entered(body: Node2D) -> void:
	Global.shot_ready = true
	print("dead")


func _on_ghost_ball_timeout_timeout() -> void:
	queue_free()


func _on_particle_timout_timeout() -> void:
	$CPUParticles2D.emitting = false
