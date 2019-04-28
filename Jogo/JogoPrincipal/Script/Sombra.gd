extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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
	
	if(posicaoAnterior.x - position.x == 0):
		if(orientacao == "direita"):
			orientacao = "esquerda"
		else:
			orientacao = "direita"
	
	if(orientacao == "direita"):
		velocidade.x = 410
	else:
		velocidade.x -= 410
	
	posicaoAnterior = position
	

func _on_Area2D_area_entered(area):
	if(area.is_in_group("Luz")):
		vida -= 1
	
	if(vida <= 0):
		self.queue_free()
	
	pass # Replace with function body.
