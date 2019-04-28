extends Sprite

onready var texturaAndando = preload("res://Sprite/arqueira/andando.png")
onready var texturaParado = preload("res://Sprite/arqueira/parado.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Arqueira.andando):
		self.textura = texturaAndando
	else:
		self.textura = texturaParado
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
