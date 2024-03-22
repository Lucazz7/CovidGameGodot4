extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if (Input.is_action_just_pressed("pause")):
			if get_tree().paused == false:
				get_tree().paused = true
				$Label.visible = true
			else:
				get_tree().paused = false
				$Label.visible = false
