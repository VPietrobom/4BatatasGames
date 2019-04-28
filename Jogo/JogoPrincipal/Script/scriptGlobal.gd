extends Node

var moeda = 0
var batata = 0
var energia = 0
var personagemEscolhido = -1
var vida = 100
var temLanterna = false
var andando = true
var lanterna = false
var hero = "res://Arqueira.tscn"

var dano = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if(hero == "res://Arqueira.tscn"):
		self.dano = 50
	elif (hero == "res://Espadeira.tscn"):
		self.dano = 125
	elif(hero == "res://Escudeiro.tscn"):
		self.dano = 30
	else:
		self.dano = 75
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
