extends KinematicBody2D

var velocidade_atual = Vector2(0, 0)
var SPEED = 400
var GRAVITY = 2000
var dir_x = 1
var jump = 800
var puloDuplo = true
var vida = 1750
var dentro  = false

onready var texturaAndando = preload("res://Sprite/lanceiro/andando.png")
onready var texturaParado = preload("res://Sprite/lanceiro/parado.png")
onready var texturaAtaque = preload("res://Sprite/lanceiro/atacando.png")
onready var texturaAndandoLuz = preload("res://Sprite/lanceiro/Landando.png")
onready var texturaParadoLuz = preload("res://Sprite/lanceiro/Lparado.png")
onready var texturaAtaqueLuz = preload("res://Sprite/lanceiro/Latacando.png")

var luz = false

var intervalo = 0

var tempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	intervalo = delta
	
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
		$Area2D.rotation_degrees = 0
		$ConeLuz.rotation_degrees = 0
	if Input.is_action_pressed("Esquerda") and !Input.is_action_pressed("Direita"):
		velocidade_atual.x = -SPEED
		dir_x = -1
		
		if(luz):
			$Sprite.texture = texturaAndandoLuz
		else:
			$Sprite.texture = texturaAndando
		
		$Sprite.flip_h = true
		$Area2D.rotation_degrees = 180
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
	
	if(is_on_ceiling() and velocidade_atual.y < 0):
		velocidade_atual.y = 0
				
	$Area2D/CollisionShape2D.set_disabled(true)
	if(Input.is_action_just_pressed("Ataque")):
		$Sprite.texture = texturaAtaque
		$Area2D/CollisionShape2D.set_disabled(false)
		luz = false
	
	
	if(Input.is_action_pressed("Lanterna") and scriptGlobal.temLanterna):
		scriptGlobal.lanterna = true
		
		if(scriptGlobal.energia>0):
			$Sprite.texture = texturaAtaqueLuz
			$ConeLuz/CollisionShape2D.set_disabled(false)
			$ConeLuz/Sprite.show()
			luz = true
		else:
			$ConeLuz/CollisionShape2D.set_disabled(true)
			$ConeLuz/Sprite.hide()
	else:
		$ConeLuz/CollisionShape2D.set_disabled(true)
		$ConeLuz/Sprite.hide()
		scriptGlobal.lanterna = false

	move_and_slide(velocidade_atual, Vector2(0, -1))
		
	if(dentro):
		if (tempo == 0):
			vida -= 150
		if (vida <= 0):
			scriptGlobal.batata = 0
			scriptGlobal.moeda = 0
			get_tree().change_scene("res://Cena/Level1.tscn")
		tempo += intervalo
		if (tempo > 2):
			tempo = 0
			pass
	pass


func _on_Area2D2_body_entered(body):
	dentro = true
	pass


func _on_Area2D2_body_exited(body):
	dentro = false
	pass # Replace with function body.
