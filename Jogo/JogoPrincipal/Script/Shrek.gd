extends KinematicBody2D

onready var Jogador = null
var velocidade_atual = Vector2(0, 0)
var SPEED = 200
var GRAVITY = 2000
var jump = 800

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Jogador != null:
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

	move_and_slide_with_snap(velocidade_atual, Vector2(0,5), Vector2(0, -1))