extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Arq_pressed():
	scriptGlobal.hero = "res://Arqueira.tscn"
	get_tree().change_scene("res://Cena/Level1.tscn")
	pass # Replace with function body.


func _on_Escu_pressed():
	scriptGlobal.hero = "res://Escudeiro.tscn"
	get_tree().change_scene("res://Cena/Level1.tscn")
	pass # Replace with function body.


func _on_Espa_pressed():
	scriptGlobal.hero = "res://Espadeira.tscn"
	get_tree().change_scene("res://Cena/Level1.tscn")
	pass # Replace with function body.


func _on_Lanc_pressed():
	scriptGlobal.hero = "res://Lanceiro.tscn"
	get_tree().change_scene("res://Cena/Level1.tscn")
	pass # Replace with function body.
