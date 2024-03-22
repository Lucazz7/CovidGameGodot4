extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.9



# Called when the node enters the scene tree for the first time.
func _ready():
	
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 300
	


func _process(delta):
	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		if($".".position.x >= posicao_final):
			flip = false
			
	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		if ($".".position.x <= posicao_inicial):
			flip = true
