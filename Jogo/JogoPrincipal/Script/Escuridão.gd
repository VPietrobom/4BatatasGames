extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var escalonamentoExterno = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position = get_parent().get_node("Personagem").position
	
	if(!escalonamentoExterno):
		if(scriptGlobal.lanterna == true and scriptGlobal.energia != 0):
			$Sprite.scale.x = 0
			$Sprite.scale.y = 0
		elif(scriptGlobal.lanterna == true and scriptGlobal.energia == 0):
			$Sprite.scale.x = 3
			$Sprite.scale.y = 3
		elif(scriptGlobal.temLanterna == true):
			$Sprite.scale.x = 3
			$Sprite.scale.y = 3
		else:
			$Sprite.scale.x = 3
			$Sprite.scale.y = 3