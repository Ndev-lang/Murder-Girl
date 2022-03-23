extends Sprite

var colisao = 0
signal item

func _on_Area2D_body_entered(body):
	$som.play()
	colisao = 1


func _on_Area2D_body_exited(body):
	colisao = 0


func _on_Player_pegar():
	if colisao == 1:
		queue_free()
		emit_signal("item")
		
		
