extends Area2D
var or_equerda = false
var velocidade = 900

func _process(delta):
	if(or_equerda):
		translate(Vector2(velocidade * delta,0))
		$Sprite2D.flip_h = false
	else:
		translate(Vector2(velocidade * delta * (-1),0))
		$Sprite2D.flip_h = true


func _on_Area2D_area_entered(area):
	queue_free()


func _on_Area2D_area_exited(area):
	queue_free()
