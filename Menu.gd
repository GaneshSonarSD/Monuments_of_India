extends Node2D

func _on_Start_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Main.tscn")

func _on_Leaderboard_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Leaderboard.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Help_About_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Help_About.tscn")
