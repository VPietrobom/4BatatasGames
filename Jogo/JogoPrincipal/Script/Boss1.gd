extends KinematicBody2D

onready var Jogador = null
var velocidade_atual = Vector2(0, 0)
var SPEED = 200
var GRAVITY = 2000
var jump = 800
var vida = 1000
var comecar = false
var parte2 = false
var esperar = false
var tempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Monstros")
	
	$Label.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(comecar == true):
		if Jogador != null and esperar == false:
			if ((self.position.x > Jogador.position.x and (self.position.x - Jogador.position.x) < 1000) or (Jogador.position.x > self.position.x and (self.position.x - Jogador.position.x) < 1000)):
				if Jogador.position.x < position.x:
					velocidade_atual.x = -SPEED
					$Sprite.flip_h = false
					$Skate.flip_h = true
				elif Jogador.position.x > position.x:
					velocidade_atual.x = SPEED
					$Sprite.flip_h = true
					$Skate.flip_h = false
			velocidade_atual.y += GRAVITY*delta
			if (is_on_floor()):
				velocidade_atual.y = 0
				pass
			if (is_on_wall() and is_on_floor()):
				velocidade_atual.y -= jump
				pass
			pass
	if(vida <= 0 and parte2 == false):
		vida = 10
		$Sprite.set_animation("Escuro")
		
		velocidade_atual.x = 0
		velocidade_atual.y = 0
		
		esperar = true
		tempo = 0
		$Label.show()
		parte2 = true
	elif(vida<=0 and parte2 == true):
		get_tree().change_scene("res://Cena/Level4.tscn")
		
	elif(vida<=0):
		pass
	
	if(esperar == true):
		tempo += delta
		velocidade_atual.y = 1000
		if(tempo>5):
			esperar = false
			$Label.hide()
			scriptGlobal.temLanterna = true
			velocidade_atual.y = 0
		
	move_and_slide_with_snap(velocidade_atual, Vector2(0,5), Vector2(0, -1))
	pass
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("Arma") and parte2 == false:
		vida -= scriptGlobal.dano
	elif (area.is_in_group("Luz")) and parte2 == true:
		vida -= 1
		

	#move_and_slide_with_snap(velocidade_atual, Vector2(0,5), Vector2(0, -1))