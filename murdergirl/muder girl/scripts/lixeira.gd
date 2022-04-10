extends Sprite
var coli = 0
var morte = 0
var ene = 0
signal morreu


func _physics_process(delta):
	executa()

func _on_Area2D_body_entered(body):
	coli = 1
	test(body)
	$trash.play()

func test(body):
	if body.name == "enemy":
		emit_signal("morreu")
		ene = 1
	elif body.name == "enemy2":
		emit_signal("morreu")
		ene = 2
	elif body.name == "enemy3":
		emit_signal("morreu")
		ene = 3
	elif body.name == "enemy4":
		emit_signal("morreu")
		ene = 4
	elif body.name == "enemy5":
		emit_signal("morreu")
		ene = 5
	elif body.name == "enemy6":
		emit_signal("morreu")
		ene = 6
func executa():
	if coli == 1 and ene == 1 and  Input.is_action_pressed("action"):
		get_node("../../student/enemy").visible = false
		get_node("../../student/enemy").position.y = -100
	elif coli == 1 and ene == 2 and  Input.is_action_pressed("action"):
		get_node("../../student/enemy2").visible = false
		get_node("../../student/enemy2").position.y = -100
	elif coli == 1 and ene == 3 and  Input.is_action_pressed("action"):
		get_node("../../student/enemy3").visible = false
		get_node("../../student/enemy3").position.y = -100
	elif coli == 1 and ene == 4 and  Input.is_action_pressed("action"):
		get_node("../../student/enemy4").visible = false
		get_node("../../student/enemy4").position.y = -100
	elif coli == 1 and ene == 5 and  Input.is_action_pressed("action"):
		get_node("../../student/enemy5").visible = false
		get_node("../../student/enemy5").position.y = -100
	elif coli == 1 and ene == 6 and  Input.is_action_pressed("action"):
		get_node("../../student/enemy6").visible = false
		get_node("../../student/enemy6").position.y = -100

func _on_Area2D_body_exited(body):
	coli = 0
