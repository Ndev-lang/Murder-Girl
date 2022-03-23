extends KinematicBody2D
var picked = false 
var velocity = Vector2(0,0)
var emorto = 0
var coli = 0
var colie = 0
var idx = 0
var num = 0
var ene1 = "../enemy"
var ene2 = "../enemy2"
var ene3 = "../enemy3"
var ene4 = "../enemy4"
var ene5 = "../enemy5"
var ene6 = "../enemy6"
export var morte = 0
export var speed = 50
export var direction = -1
export var detects_cliffs = true
#ready
func _ready():
	$Sprite.play("andando")
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	emorto = 0
#move
func _physics_process(delta):
	idx = chamarallene()
	if Input.is_action_pressed("pegar"):
		if emorto == 1:
			#if self.name == "enemy" and get_node("../enemy2").global_position != get_node("../../Player/Position2D").global_position and coli == 0:
				#get_node("../enemy").global_position = get_node("../../Player/Position2D").global_position
			#elif self.name == "enemy2" and get_node("../enemy").global_position != get_node("../../Player/Position2D").global_position and coli == 0:
				#get_node("../enemy2").global_position = get_node("../../Player/Position2D").global_position
			if self.global_position != null:
				enetest2("enemy", ene2, ene3, ene4, "../enemy")
				enetest2("enemy2" , ene1, ene3, ene4, "../enemy2")
				enetest2("enemy3" , ene1, ene2, ene4, "../enemy3")
				enetest2("enemy4" , ene6, ene6, ene6, "../enemy4")
				enetest2("enemy5" , ene6, ene6, ene6, "../enemy5")
				enetest2("enemy6" , ene6, ene6, ene6, "../enemy6")
			else:
				pass
			
	if emorto == 1:
		
		$Sprite.stop()
		$vision/CollisionPolygon2D.disabled = true
		$vision/CollisionPolygon2D2.disabled = true
		return
	if direction == 1:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	velocity.y += 20
	velocity.x = speed * direction
	velocity = move_and_slide(velocity,Vector2.UP)
#input event
func _input(event):
	if Input.is_action_pressed("pegar"):
		testall()
#vision
func _on_sides_check_area_entered(area):
	morte = 1
	get_node("enemy detector").set_collision_mask_bit(0, true)
	if morte == 1 and emorto == 0:
		speed = 0
		$AnimationPlayer.play("morte")
		emorto = 1
#test what enemy is
func testall():
	if get_node("../enemy") == null:
		ene1 = ene2
	elif get_node("../enemy2") == null:
		 ene2 = ene3
	elif get_node("../enemy3") == null:
		ene2 = ene3
	elif get_node("../enemy4") == null:
		 ene4 = ene5
	elif get_node("../enemy5") == null:
		 ene5 = ene6
	else:
		 ene6 = ene6
func enetest(name,nameb, namec, named, namee, namef, nameh):
	if self.name == name \
	and !get_node(nameb).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(namec).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(named).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(namee).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(namef).global_position  == get_node("../../Player/Position2D").global_position \
	and coli == 1:
		get_node(nameh).global_position = get_node("../../Player/Position2D").global_position
func enetest1(name,nameb, namec, named, namee, nameh):
	if self.name == name \
	and !get_node(nameb).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(namec).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(named).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(namee).global_position  == get_node("../../Player/Position2D").global_position \
	and coli == 1:
		get_node(nameh).global_position = get_node("../../Player/Position2D").global_position
func enetest2(name,nameb, namec, named, nameh):
	if self.name == name \
	and !get_node(nameb).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(namec).global_position  == get_node("../../Player/Position2D").global_position \
	and !get_node(named).global_position  == get_node("../../Player/Position2D").global_position \
	and coli == 1:
		get_node(nameh).global_position = get_node("../../Player/Position2D").global_position
	elif self.name == null:
		get_node("../../Player/Position2D").global_position = get_node("../../Player/Position2D").global_position
#collision enter detector
func _on_Area2D_body_entered(body):
	coli = 1
#collision exit detector
func _on_Area2D_body_exited(body):
	coli = 0
#collision enter detector
func _on_enemy_detector_body_entered(body):
	colie = 1
	$scream.play()
#collision exit detector
func _on_enemy_detector_body_exited(body):
	colie = 0
#dead
func chamarallene():
	if get_node("../enemy") == null:
		return 0
	elif get_node("../enemy").emorto == 1:
		return 1
	if get_node("../enemy2") == null:
		return 0
	elif get_node("../enemy2").emorto == 1:
		return 1
	elif get_node("../enemy3") == null:
		return 0
	elif get_node("../enemy3").emorto == 1:
		return 1
	if get_node("../enemy4") == null:
		return 0
	elif get_node("../enemy4").emorto == 1:
		return 1
	if get_node("../enemy5") == null:
		return 0
	elif get_node("../enemy5").emorto == 1:
		return 1
	if get_node("../enemy6") == null:
		return 0
	elif get_node("../enemy6").emorto == 1:
		return 1
#vision detector
func _on_vision_body_entered(body):
	if get_node("../../Player").matar == 1 or idx == 1 and  get_node("../../Player").colision == 1:
		get_tree().change_scene("res://scenes/gameover.tscn")
