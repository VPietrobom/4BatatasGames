extends Node2D

# Declare member variables here. Examples:
# var a = 2

var cena_personagem = load(scriptGlobal.hero)

# Called when the node enters the scene tree for the first time.
func _ready():
	var personagem = cena_personagem.instance()
	personagem.name = "Personagem"
	add_child(personagem)
	personagem.position.x = 50
	$Boss1.Jogador = personagem
	personagem.get_node("Camera2D").set_limit(2, 3086.958)	
	
	$Escuridao.get_node("Sprite").scale.x = 0.75
	$Escuridao.get_node("Sprite").scale.y = 0.5
	
	$Escuridao.escalonamentoExterno = true
	
	$Escuridao.show()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Inicio_body_entered(body):
	pass # Replace with function body.
