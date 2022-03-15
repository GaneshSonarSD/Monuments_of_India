extends Node2D

func _on_LineEdit_text_entered(new_text):
	#Save Game
	var file = File.new()
	var user_info = []
	
	file.open("res://User_Scores.save",file.READ)
	user_info = file.get_var()
	file.close()
	
	file.open("res://User_Scores.save",file.WRITE)
	var tmp = [0,false]
	if user_info != null:
		for i in user_info:
			if (i["Name"] == new_text) && (i["Score"]<Comm.Score):
				user_info[tmp[0]]["Score"] = Comm.Score
				tmp[1] = true
			if (i["Name"] == new_text) && (i["Score"]>Comm.Score):
				#user_info[tmp[0]]["Score"] = Comm.Score
				tmp[1] = true
			tmp[0]+=1
		if tmp[1] == false:
			user_info.append({"Name":new_text,"Score":Comm.Score})
	else:
		user_info = []
		user_info.append({"Name":new_text,"Score":Comm.Score})
	file.store_var(user_info)
	file.close()
	
	Comm.reset_game()
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")


func _on_Skip_pressed():
	Comm.reset_game()
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")
