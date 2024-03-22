extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.4
var posicao_cima
var posicao_baixo

func _ready():
	$Sprite2D/AnimationPlayer.play("voando")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 300
	
	$Sprite2D/AnimationPlayer.play("voando")
	posicao_cima = $".".position.y
	posicao_baixo = posicao_cima - 1
	
func _process(delta):
	
	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Sprite2D.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false
			
	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Sprite2D.flip_h = true
		if ($".".position.x <= posicao_inicial):
			flip = true
			
func dano():
	$".".queue_free()



func _on_Area2D_area_entered(area):
	queue_free()
