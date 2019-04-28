extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	if(global.personagemEscolhido == 0): #Arco
		self.texture = res://Script/Arco/parado.png
	elif(global.personagemEscolhido == 1): #Escudo
		self.texture = res://Script/Escudo/parado.png
	elif(global.personagemEscolhido == 2): #Espada
		res://Script/Espada/parado.png
	else:#Lança
		res://Script/Lanca/parado.png
	pass # Replace with function body. 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
