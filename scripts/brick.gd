extends StaticBody2D

var hit = false
var orange : bool
var purple : bool

func _on_area_2d_body_entered(body: Node2D) -> void:
	# points system
	if not hit:
		if orange:
			Global.points += 100
			Global.temp_points += 100
			Global.sound_points += 100
		elif purple:
			$aah.play()
			Global.points += 500
			Global.temp_points += 750
			Global.sound_points += 500
		else:
			Global.points += 10
			Global.temp_points += 30
			Global.sound_points += 30
		
		$hit_sound.pitch_scale = (Global.sound_points * 0.002) + 1
		$hit_sound.play()
		Global.streak += 1
		
	
	
	
	if body.is_in_group("Ball"):
		hit = true
		if orange:
			$Orange_Brick_Hit.show()
		elif purple:
			$purple_brick_hit.show()
		else:
			$Blue_Brick_Hit.show()

func become_orange():
	$Orange_Brick.show()
	$Blue_Brick.hide()
	
func become_purple():
	purple = true
	$purple_brick.show()
	$Orange_Brick.hide()
	$Blue_Brick.hide()

func become_unpurple():
	purple = false
	$purple_brick.hide()
	$Blue_Brick.show()
