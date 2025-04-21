extends StaticBody2D

var hit = false
var orange : bool

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		hit = true
		$blue_peg_hit.show()
	
