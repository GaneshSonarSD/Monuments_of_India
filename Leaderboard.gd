extends Node2D

onready var labl = get_node("Label")

func _ready():
	var user_info
	var text = "Name                                       Score\n"
	var tmp
	var tmp2
	labl.scroll_active = true
	var file = File.new()
	file.open("res://User_Scores.save",file.READ)
	user_info = file.get_var()
	file.close()
	
	if user_info != null:
		for i in user_info:
			tmp = i["Name"]
			tmp2 = 43 - len(tmp)
			for a in tmp2:
				tmp += "-"
			tmp += str(i["Score"]) + "\n"
			text = text + tmp
		labl.text = text

func _on_Exit_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")
