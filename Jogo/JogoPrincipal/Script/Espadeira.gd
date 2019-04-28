extends KinematicBody2D

var velocidade_atual = Vector2(0, 0)
var SPEED = 400
var GRAVITY = 2000
var dir_x = 1
var jump = 800
var puloDuplo = true

onready var texturaAndando = preload("res://Sprite/espadeira/andando.png")
onready var texturaParado = preload("res://Sprite/espadeira/parado.png")
onready var texturaAtaque = preload("res://Sprite/espadeira/atacando.png")
onready var texturaAndandoLuz = preload("res://Sprite/espadeira/Landando.png")
onready var texturaParadoLuz = preload("res://Sprite/espadeira/Lparado.png")
onready var texturaAtaqueLuz = preload("res://Sprite/espadeira/Latacando.png")

var luz = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	velocidade_atual.x = 0
	velocidade_atual.y += delta*GRAVITY
	if Input.is_action_pressed("Direita") and !Input.is_action_pressed("Esquerda"):
		velocidade_atual.x = SPEED
		dir_x = 1
		
		if(luz):
			$Sprite.texture = texturaAndandoLuz
		else:
			$Sprite.texture = texturaAndando
			
		$Sprite.flip_h = false	
		$Espada.rotation_degrees = 0
		$ConeLuz.rotation_degrees = 0
	if Input.is_action_pressed("Esquerda") and !Input.is_action_pressed("Direita"):
		velocidade_atual.x = -SPEED
		dir_x = -1
		
		if(luz):
			$Sprite.texture = texturaAndandoLuz
		else:
			$Sprite.texture = texturaAndando
		
		$Sprite.flip_h = true
		$Espada.rotation_degrees = 180
		$ConeLuz.rotation_degrees = 180
	if !Input.is_action_pressed("Direita") and !Input.is_action_pressed("Esquerda"):
		if(luz):
			$Sprite.texture = texturaParadoLuz
		else:
			$Sprite.texture = texturaParado

	if(is_on_floor()):
		puloDuplo = true
		velocidade_atual.y = 0
		if Input.is_action_just_pressed("Cima"):
			velocidade_atual.y -= jump
			
	elif puloDuplo:
		if Input.is_action_just_pressed("Cima"):
			puloDuplo = false
			velocidade_atual.y = -jump
	
	if(is_on_ceiling()):
		velocidade_atual.y = 0
				
	$Espada/CollisionShape2D.set_disabled(true)
	if(Input.is_action_just_pressed("Ataque")):
		$Sprite.texture = texturaAtaque
		$Espada/CollisionShape2D.set_disabled(false)
		luz = false
	
	
	if(Input.is_action_pressed("Lanterna")):
		$Sprite.texture = texturaAtaqueLuz
		$ConeLuz/CollisionShape2D.set_disabled(false)
		$ConeLuz/Sprite.show()
		luz = true
	else:
		$ConeLuz/CollisionShape2D.set_disabled(true)
		$ConeLuz/Sprite.hide()

	move_and_slide(velocidade_atual, Vector2(0, -1))