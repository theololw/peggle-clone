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
			$PegOrangeHit.show()
		elif purple:
			$PurpleHit.show()
		else:
			$blue_peg_hit.show()
		
	
	
func become_orange():
	$PegOrange.show()
	$blue_peg.hide()
	purple = false
	
	Global.total_oranges += 1

func become_purple():
	purple = true
	$PurplePeg.show()
	$PegOrange.hide()
	$blue_peg.hide()

func become_unpurple():
	purple = false
	$PurplePeg.hide()
	$blue_peg.show()
