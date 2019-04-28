extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cena_personagem = load("res://Escudeiro.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var personagem = cena_personagem.instance()
	add_child(personagem)
	personagem.name = "joaozinho"
	personagem.position.x = 50
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
