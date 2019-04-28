extends Node

var moeda = 0
var moedaTotal = 0
var batata = 0
var batataTotal = 0
var energia = 0
var personagemEscolhido = -1
var vida = 100
var temLanterna = true
var andando = true
var lanterna = false
var hero = "res://Arqueira.tscn"
var timer = false
var inArea = false
var dano = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if(hero == "res://Arqueira.tscn"):
		dano = 50
	if(hero == "res://Escudeiro.tscn"):
		dano = 30
	if(hero == "res://Lanceiro.tscn"):
		dano = 75
	if(hero == "res://Espadeira.tscn"):
		dano = 125
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
