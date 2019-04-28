extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position = get_parent().get_node("Personagem").position
	if(scriptGlobal.lanterna == true and scriptGlobal.energia == 0):
		$Sprite.scale.x = 1
		$Sprite.scale.y = 1
	elif(scriptGlobal.temLanterna == true):
		$Sprite.scale.x = 1
		$Sprite.scale.y = 1
	else:
		$Sprite.scale.x = 1
		$Sprite.scale.y = 1