extends KinematicBody2D
const GRAVITY = 35
const JUMPFORCE = -1150
var velocity = Vector2(0,0)
var coins = 0
var SPEED = 250
var colision = 0
var canPick = true
var item = 0
var matar = 0
signal pegar
signal subir
signal subirf
func _ready():
	facaoff()
func _physics_process(delta):
	if Input.is_action_pressed("up"):
		emit_signal("subir")
	else:
		emit_signal("subirf")
	if Input.is_action_pressed("pegar"):
		emit_signal("pegar")
	elif Input.is_action_pressed("action"):
		matar = 1
		if item == 1 and colision == 1:
			facaon()
			Input.action_release("left")
			Input.action_release("right")
			$Sprite.play("kill")
		else:
			Input.action_release("left")
			Input.action_release("right")
			$Sprite.play("parado")
	else:
		matar = 0
		facaoff()
	if Input.is_action_pressed("run"):
		SPEED = 300
	else:
		SPEED = 250
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("andando")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("andando")
		$Sprite.flip_h = true
	
		emit_signal("matarf")
	else:
		velocity.x = 0
		SPEED = 0
		if !Input.is_action_pressed("action"):
			$Sprite.play("parado")
	#if not is_on_floor():
		#$Sprite.play("air")
	velocity.y = velocity.y + GRAVITY
	velocity = move_and_slide(velocity,Vector2.UP)

func facaon():
	$Area2D.set_collision_layer_bit(4, true)
	$Area2D.set_collision_mask_bit(6, true)
func facaoff():
	$Area2D.set_collision_layer_bit(4, false)
	$Area2D.set_collision_mask_bit(6, false)


func _on_Area2D2_body_entered(body):
	colision = 1



func _on_Area2D2_body_exited(body):
	colision = 0

func _on_item_item():
	item = 1
