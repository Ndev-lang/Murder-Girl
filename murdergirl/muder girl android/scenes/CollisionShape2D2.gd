extends CollisionPolygon2D

var on = 0

func _ready():
	disabled = true

func entrou(body):
	on = 1
	


func entrou1(body):
	on = 0


func _on_Player_subir():
	if on == 0:
		disabled = false


func _on_Player_subirf():
	if on == 0:
		disabled = true
