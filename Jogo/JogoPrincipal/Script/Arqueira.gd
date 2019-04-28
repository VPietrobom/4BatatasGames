extends KinematicBody2D

var velocidade_atual = Vector2(0, 0)
var SPEED = 400
var GRAVITY = 2000
var dir_x = 1
var jump = 800
var puloDuplo = true
var vida = 1500
var dentro  = false

onready var texturaAndando = preload("res://Sprite/arqueira/andando.png")
onready var texturaParado = preload("res://Sprite/arqueira/parado.png")
onready var texturaAtaque = preload("res://Sprite/arqueira/atacando.png")
onready var texturaAndandoLuz = preload("res://Sprite/arqueira/Landando.png")
onready var texturaParadoLuz = preload("res://Sprite/arqueira/Lparado.png")
onready var texturaAtaqueLuz = preload("res://Sprite/arqueira/Latacando.png")

var luz = false

var flechaDefinicao = load("res://Flecha.tscn")

var intervalo = 0

var tempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	scriptGlobal.vida = vida
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
		$ConeLuz.rotation_degrees = 0
	if Input.is_action_pressed("Esquerda") and !Input.is_action_pressed("Direita"):
		velocidade_atual.x = -SPEED
		dir_x = -1
		
		if(luz):
			$Sprite.texture = texturaAndandoLuz
		else:
			$Sprite.texture = texturaAndando
		
		$Sprite.flip_h = true
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
				
	
	if(Input.is_action_just_pressed("Ataque")):
		$Sprite.texture = texturaAtaque
		var flecha = flechaDefinicao.instance()
		get_parent().add_child(flecha)
		flecha.position = position
		flecha.position.y += 60
		if($Sprite.flip_h == true):
			flecha.position.x = position.x - 68
			flecha.get_node("Sprite").flip_h = true
			flecha.direcao *= -1
		else:
			flecha.position.x = position.x + 68
		
		luz = false
	
	if(Input.is_action_pressed("Lanterna") and scriptGlobal.temLanterna == true):
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
	
	move_and_slide_with_snap(velocidade_atual, Vector2(0,5),Vector2(0, -1))
	
	if(dentro):
		if (tempo == 0):
			vida -= 150
		if (vida <= 0):
			scriptGlobal.batata = 0
			scriptGlobal.moeda = 0
			get_tree().change_scene("res://Cena/Level1.tscn")
		tempo += intervalo
		if (tempo > 0.5):
			tempo = 0
			pass
	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Monstros"):
		dentro = true
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	dentro = false
	pass # Replace with function body.
