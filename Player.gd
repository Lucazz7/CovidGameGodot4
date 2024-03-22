extends CharacterBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -600
var life = 3
var motion = Vector2()
var moedas = 0
var remedioCount = 0

func _ready():
	$player1.hide()
	$player2.hide()
	$sons/music.play()
	
	
	if (global.player==1):
		$player1.show()
	if (global.player==2):
		$player2.show()
		
func _physics_process(delta):
	
	
	motion.y += GRAVITY

	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$player1/AnimationPlayer.play("andando")
		$player2/AnimationPlayer.play("andando")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$player1/AnimationPlayer.play("andando")
		$player2/AnimationPlayer.play("andando")
		$player1.flip_h = true
		$player2.flip_h = true
		
	else:
		$player1/AnimationPlayer.play("parado")
		$player2/AnimationPlayer.play("parado")
		$player1.flip_h = false
		$player2.flip_h = false
		motion.x = 0
		
		
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			$player1/AnimationPlayer.play("pulo")
			$player2/AnimationPlayer.play("pulo")
			$sons/pulo.play()
			motion.y = JUMP_HEIGHT
	else:
		$player1/AnimationPlayer.play("pulo")
		$player2/AnimationPlayer.play("pulo")
	set_velocity(motion)
	set_up_direction(UP)
	move_and_slide()
	motion = velocity
	
	if (Input.is_action_just_pressed("tiro")):
		$sons/disparo.play()
		var cena_disparo = preload("res://disparo.tscn")
		var objeto_disparo = cena_disparo.instantiate()
		if ($player1 and $player2.flip_h):
			objeto_disparo.global_position = $Position2D2.global_position
		else:
			objeto_disparo.global_position = $Marker2D.global_position
		get_tree().root.add_child((objeto_disparo))
		objeto_disparo.get_node("Area2D").or_equerda = not $player1.flip_h
		objeto_disparo.get_node("Area2D").or_equerda = not $player2.flip_h
		
#moedas
	$CanvasLayer/Label.set_text(str(moedas))
	


func _on_pes_body_entered(body):
	body.dano()
	motion.y = JUMP_HEIGHT


func _on_dano_body_entered(body):
		life -= 1

		if(life == 2):
			$CanvasLayer/vida1.hide()
		if(life ==1):		
			$CanvasLayer/vida2.hide()
		if(life ==0):		
			$CanvasLayer/vida3.hide()
		if(life==0):		
			get_tree().change_scene_to_file("res://restart.tscn")
			
			
	
	
func moeda():
	moedas += 1 
	$sons/moeda.play()
	pass
	
func remedio():
	var remedio_pontos = 20  # Or any other appropriate name
	moedas += remedio_pontos
	$sons/moeda.play()
	pass
#	life -= 1
#	if(life == 2):
#		$vida1.hide()
#	if(life ==1):		
#		$vida2.hide()
#	if(life ==0):		
#		$vida3.hide()
		
#	if(life==0):		
#		get_tree().change_scene("res://menu.tscn")


#func diminuir_vida():
#	life -= 1
#
#	if(life == 2):
#		get_parent().get_node("vida1").hide()
#	if(life ==1):		
#		get_parent().get_node("vida2").hide()
#	if(life ==0):		
#		get_parent().get_node("vida1").hide()


