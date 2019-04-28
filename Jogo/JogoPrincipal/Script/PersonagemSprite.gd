extends Sprite

onready var textura4 = preload("res://Sprite/Lanceiro/parado.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	if(scriptGlobal.personagemEscolhido == 0): #Arco
		#self.texture = res://Script/Arco/parado.png
		pass
	elif(scriptGlobal.personagemEscolhido == 1): #Escudo
		#self.texture = "res://Script/Escudo/parado.png"
		pass
	elif(scriptGlobal.personagemEscolhido == 2): #Espada
		#self.texture = "res://Script/Espada/parado.png"
		pass
	else:#Lança
		self.texture = textura4
	pass # Replace with function body. 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
