extends Node

var VidaMonstro = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("monstro")
	pass # Replace with function body.

func _process(delta):
	if (VidaMonstro <= 0):
		self.queue_free()
		pass
	pass
