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
var c = 0
var song = 0
var wsong = 0
signal pegar
signal subir
signal subirf
#ready
func _ready():
	facaoff()
#sound
#func _som():
	#$AudioStreamPlayer2D.play("res://sound effect/336598__inspectorj__footsteps-concrete-a.ogg")
func _playsom():
	if (wsong == 0):
		$walk.play()
	elif (wsong == 1):
		$knife.play()
func _stopsom():
	$walk.stop()
#move
func _input(event):
	if Input.is_action_pressed("up"):
		emit_signal("subir")
	else:
		emit_signal("subirf")
	if Input.is_action_pressed("pegar"):
		if !Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
			$Sprite.play("crouchstart")
		emit_signal("pegar")
	elif Input.is_action_pressed("action"):
		if (song == 0):
			wsong = 1
			song = 1
		_playsom()
		matar = 1
		if item == 1 and colision == 1:
			facaon()
			Input.action_release("left")
			Input.action_release("right")
			$Sprite.play("kill")
		else:
			Input.action_release("left")
			Input.action_release("right")
			$Sprite.play("kill")
	else:
		matar = 0
		facaoff()

func _physics_process(delta):
	if Input.is_action_pressed("run"):
		SPEED = 300
	else:
		SPEED = 250
	if Input.is_action_pressed("right"):
		if (song == 0):
			wsong = 0
			_playsom()
			song = 1
		if Input.is_action_pressed("pegar"):
			velocity.x = -SPEED
			$Sprite.play("crouchwalk")
		else:
			velocity.x = SPEED
			$Sprite.play("andando")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		if (song == 0):
			wsong = 0
			_playsom()
			song = 1
		if Input.is_action_pressed("pegar"):
			velocity.x = SPEED
			$Sprite.play("crouchwalk")
		else:
			velocity.x = -SPEED
			$Sprite.play("andando")
		$Sprite.flip_h = true
		emit_signal("matarf")
	else:
		if (wsong == 0):
			_stopsom()
		song = 0
		velocity.x = 0
		SPEED = 0
		if !Input.is_action_pressed("action") and !Input.is_action_pressed("pegar"):
			$Sprite.play("parado")
	#if not is_on_floor():
		#$Sprite.play("air")
	velocity.y = velocity.y + GRAVITY
	velocity = move_and_slide(velocity,Vector2.UP)
#knife on
func facaon():
	$Area2D.set_collision_layer_bit(4, true)
	$Area2D.set_collision_mask_bit(6, true)
#knife off
func facaoff():
	$Area2D.set_collision_layer_bit(4, false)
	$Area2D.set_collision_mask_bit(6, false)
#collision enter detector
func _on_Area2D2_body_entered(body):
	colision = 1
#collision exit detector
func _on_Area2D2_body_exited(body):
	colision = 0
#item
func _on_item_item():
	item = 1
