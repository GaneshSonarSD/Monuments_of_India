extends Node2D

onready var monument:Sprite = get_node("Monument")
onready var history = get_node("Label")
onready var title = get_node("Title")

var qus_no = 1

func _input(event):
	if event.is_action_pressed("ui_right"):
		qus_no += 1
		if qus_no >= 4: qus_no = 0
	if event.is_action_pressed("ui_left"):
		qus_no -= 1
		if qus_no <= -1: qus_no = 3
	disp(qus_no)

func disp(content):
	print(content)
	var imgStr = str("res://assets/questions/" + str(Comm.State) + "/" + str(Comm.Qus_arry[content][0]) + ".jpg")
	var img = load(imgStr)
	monument.set_texture(img)
	history.set_text(Comm.Answers[Comm.State][str(Comm.Qus_arry[content][0])]["Story"])
	
	if Comm.Qus_arry[content][1] == 1:
		title.set_text("You answered right")
	elif Comm.Qus_arry[content][1] == 2:
		title.set_text("You answered wrong")
	elif Comm.Qus_arry[content][1] == 3:
		title.set_text("You timed out")
	

func _on_Continue_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Main.tscn")
