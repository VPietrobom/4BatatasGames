extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var direcao = Vector2(1, 0)
var velocidade = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position += delta*velocidade*direcao
	pass


func _on_Flecha_body_entered(body):
	if not body.is_in_group("Personagem"):
		self.queue_free()
	pass # Replace with function body.
