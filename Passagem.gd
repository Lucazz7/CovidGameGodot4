extends Area2D

var cenas

func _on_Passagem_body_entered(Player):
	get_tree().change_scene_to_file(cenas)
