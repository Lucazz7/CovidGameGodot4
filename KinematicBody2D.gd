extends CharacterBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550
var life = 3
var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY

	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite2D.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite2D.play("run")
		$Sprite2D.flip_h = true
	else:
		motion.x = 0
		$Sprite2D.play("idle")
		$Sprite2D.flip_h = false
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite2D.play("jump")
	set_velocity(motion)
	set_up_direction(UP)
	move_and_slide()
	motion = velocity

func _on_pes_body_entered(body):
	body.dano()
	motion.y = JUMP_HEIGHT


func _on_dano_body_entered(body):
	life -= 1
	if life == 0:
		get_tree().change_scene_to_file("res://menu.tscn")
