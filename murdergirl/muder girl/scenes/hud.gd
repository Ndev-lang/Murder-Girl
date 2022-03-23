extends CanvasLayer

var text = 0

func _physics_process(delta):
	get_node("Control/Label").set_text("Murdered: " + String(text))


func _on_lixeira_morreu():
	text += 1
