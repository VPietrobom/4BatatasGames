extends Node2D

# Declare member variables here. Examples:
# var a = 2

var cena_personagem = load(scriptGlobal.hero)
var personagem = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$Escuridao.show()
	var personagem = cena_personagem.instance()
	personagem.name = "Personagem"
	personagem.get_node("Camera2D").set_limit(2, 13503.711)	
	add_child(personagem)
	$Shrek.Jogador = personagem
	$Shrek2.Jogador = personagem
	$Shrek3.Jogador = personagem
	$Shrek4.Jogador = personagem
	$Sombra.Jogador = personagem
	$Sombra2.Jogador = personagem
	$Sombra3.Jogador = personagem
	personagem.position.x = 50
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Personagem"):
		get_tree().change_scene("res://Cena/Level3.tscn")
	pass # Replace with function body.
