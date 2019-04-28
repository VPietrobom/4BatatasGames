extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var taxaEnergia = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(scriptGlobal.lanterna == true):
		if(scriptGlobal.energia == 0):
			if(scriptGlobal.batata >0):
				scriptGlobal.batata -= 1
				scriptGlobal.energia = 100
		else:
			scriptGlobal.energia = int(scriptGlobal.energia - delta * taxaEnergia)	
			if(scriptGlobal.energia < 0):
				scriptGlobal.energia = 0