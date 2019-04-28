extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Jogador = null

var velocidade_atual = Vector2(0, 0)
var SPEED = 100
var GRAVITY = 2000
var jump = 800

onready var texturaAndando0 = preload("res://Sprite/vilões player/arcoandando.png")
onready var texturaParado0 = preload("res://Sprite/vilões player/arcoparado.png")
onready var texturaAndando1 = preload("res://Sprite/vilões player/escudoandando.png")
onready var texturaParado1 = preload("res://Sprite/vilões player/escudoparado.png")
onready var texturaAndando2 = preload("res://Sprite/vilões player/espadaandando.png")
onready var texturaParado2 = preload("res://Sprite/vilões player/espadaparado.png")
onready var texturaAndando3 = preload("res://Sprite/vilões player/lancaandando.png")
onready var texturaParado3 = preload("res://Sprite/vilões player/lancaparado.png")

var vida = 5

var velocidade = Vector2(0,0)

var orientacao = "direita"

var posicaoAnterior = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Jogador != null:
		if ((self.position.x > Jogador.position.x and (self.position.x - Jogador.position.x) < 1000) or (Jogador.position.x > self.position.x and (Jogador.position.x - self.position.x) < 1000)):
			if Jogador.position.x < position.x:
				velocidade.x = -SPEED
				$Sprite.flip_h = true
			elif Jogador.position.x > position.x:
				velocidade.x = SPEED
				$Sprite.flip_h = false

		velocidade.y += GRAVITY*delta
		if (is_on_floor()):
			velocidade.y = 0
			pass
		if (is_on_wall() and is_on_floor()):
			velocidade.y -= jump
			pass

	move_and_slide_with_snap(velocidade, Vector2(0,5), Vector2(0, -1))
	
	

func _on_Area2D_area_entered(area):
	if(area.is_in_group("Luz")):
		vida -= 1
	
	if(vida <= 0):
		self.queue_free()
