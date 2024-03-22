extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 2
var life = 3

func _ready():
	$Sprite2D/AnimationPlayer.play("andando")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 400
	
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



