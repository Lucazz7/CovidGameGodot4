extends Node2D

func _ready():
	$seta.position.x = 130
	$seta.position.y = 517
	pass

func _process(_delta):
	if Input.is_action_just_pressed("ui_left"):
		var seta = get_node("seta")
		if seta:
			seta.position.x = 145

	if Input.is_action_just_pressed("ui_right"):
		var seta = get_node("seta")
		if seta:
			seta.position.x = 900

	if Input.is_action_just_pressed("ui_accept"):
		var seta = get_node("seta")
		if seta:
			var posX = seta.position.x
			if posX == 130:
				global.player = 1
			elif posX == 900:
				global.player = 2

			get_tree().change_scene_to_file("res://word.tscn")
