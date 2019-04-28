extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Inicio_body_entered(body):
	self.get_parent().get_node("Escuridao").escalonamentoExterno = false
	
	self.get_parent().get_node("Boss").comecar = true
	
	pass # Replace with function body.
