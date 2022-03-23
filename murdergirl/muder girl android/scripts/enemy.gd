extends KinematicBody2D
var picked = false
var velocity = Vector2(0,0)
var emorto = 0
var coli = 0
var colie = 0
var idx = 0
export var morte = 0
export var speed = 50
export var direction = -1
export var detects_cliffs = true

func _ready():
	$Sprite.play("andando")
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	emorto = 0
func _physics_process(delta):
	idx = chamarallene()
	if Input.is_action_pressed("pegar"):
		if emorto == 1:
			#if self.name == "enemy" and get_node("../enemy2").global_position != get_node("../../Player/Position2D").global_position and coli == 0:
				#get_node("../enemy").global_position = get_node("../../Player/Position2D").global_position
			#elif self.name == "enemy2" and get_node("../enemy").global_position != get_node("../../Player/Position2D").global_position and coli == 0:
				#get_node("../enemy2").global_position = get_node("../../Player/Position2D").global_position
			enetest("enemy",  "../enemy2", "../enemy3", "../enemy4","../enemy5","../enemy6", "../enemy")
			enetest("enemy2", "../enemy",  "../enemy3", "../enemy4","../enemy5","../enemy6", "../enemy2")
			enetest("enemy3", "../enemy",  "../enemy2", "../enemy4","../enemy5","../enemy6", "../enemy3")
			enetest("enemy4", "../enemy",  "../enemy2", "../enemy3","../enemy5","../enemy6", "../enemy4")
			enetest("enemy5", "../enemy",  "../enemy2", "../enemy3","../enemy4","../enemy6", "../enemy5")
			enetest1("enemy6", "../enemy",  "../enemy2", "../enemy3","../enemy4","../enemy6")
			
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

func _on_sides_check_area_entered(area):
	morte = 1
	get_node("enemy detector").set_collision_mask_bit(0, true)
	if morte == 1 and emorto == 0:
		speed = 0
		$AnimationPlayer.play("morte")
		emorto = 1

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

func _on_Area2D_body_entered(body):
	coli = 1
	
func _on_Area2D_body_exited(body):
	coli = 0


func _on_enemy_detector_body_entered(body):
	colie = 1


func _on_enemy_detector_body_exited(body):
	colie = 0

func chamarallene():
	if get_node("../enemy").emorto == 1:
		return 1
	elif get_node("../enemy2").emorto == 1:
		return 1
	elif get_node("../enemy3").emorto == 1:
		return 1
	elif get_node("../enemy4").emorto == 1:
		return 1
	elif get_node("../enemy5").emorto == 1:
		return 1
	elif get_node("../enemy6").emorto == 1:
		return 1

func _on_vision_body_entered(body):
	if get_node("../../Player").matar == 1 or idx == 1 and  get_node("../../Player").colision == 1:
		get_tree().change_scene("res://scenes/word.tscn")
	
