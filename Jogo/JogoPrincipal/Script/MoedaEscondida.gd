extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var moedaDefinicao = load("res://Cena/moedagamux.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_MoedaEscondida_area_entered(area):
	if(area.is_in_group("Luz")):
		var moeda = moedaDefinicao.instance()
		get_parent().add_child(moeda)
		moeda.position = position
		self.queue_free()
