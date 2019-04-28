extends KinematicBody2D

var velocidade_atual = Vector2(0, 0)
var SPEED = 400
var GRAVITY = 2000
var dir_x = 1

func _process(delta):
	velocidade_atual.x = 0
	velocidade_atual.y += delta*GRAVITY
	if Input.is_action_pressed("Direita"):
		velocidade_atual.x = SPEED
		dir_x = 1
	if Input.is_action_pressed("Esquerda"):
		velocidade_atual.x = -SPEED
		dir_x = -1
		
func _ready():
	pass # Replace with function body.
