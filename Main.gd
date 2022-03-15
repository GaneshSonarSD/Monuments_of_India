extends Node2D

onready var Qus:Sprite = get_node("Question")
onready var scr = get_node("Score")
onready var tmr = get_node("TimerDisp")
onready var timer = get_node("Timer")
onready var A = get_node("A")
onready var B = get_node("B")
onready var C = get_node("C")
onready var D = get_node("D")

var ans = [[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
var imgStr = "res://assets/0.png"
var timeDict = OS.get_time()
const timer_count = 10
var timeleft
var Ansd = 0
var img



################################################################################
#########################                                #######################
#########################    READY, PROCESS AND EXIT     #######################
#########################                                #######################
################################################################################

func _ready():
	#load blank image
	img = load(imgStr)
	Qus.set_texture(img)
	
	#load timer count
	timer.set_wait_time(timer_count)

# warning-ignore:unused_argument
func _process(delta):
	
	###########################show score and timer#############################
	scr.set_text("Score:\n"+str(Comm.Score))
	timeleft = int(timer.get_time_left())
	tmr.set_text("Timer:\n"+str(timeleft))
	
	#Check ans
	
	
	#loose check
	
	#############################time out#######################################
	if timeleft==0 && Ansd==0:
		timer.set_wait_time(timer_count)
		Comm.Qus_arry[Comm.qus_num][1] = 3
		Comm.qus_num+=1
		if (Comm.qus_num<4) : ShowImg(Comm.State)
	
	##############################qustions are done#############################
	if (Comm.qus_num == 4) && (Ansd == true):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://info.tscn")
	
	########################check for Escape press##############################
	if (Input.is_key_pressed(KEY_ESCAPE)) && (Comm.qus_num == 4):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Enter_Info.tscn")



################################################################################
#########################                                #######################
#########################          MY FUNCTIONS          #######################
#########################                                #######################
################################################################################

func  ShowImg(path) -> void :
	if path == '0':
		Comm.qus_num=0
		Comm.State = 0
		imgStr = "res://assets/0.png"
		A.text = " "
		B.text = " "
		C.text = " "
		D.text = " "
	else:
		imgStr = str("res://assets/questions/" + str(path) + "/" + str(Comm.Qus_arry[Comm.qus_num][0]) + ".jpg")
		set_qustions_lables(path)
		Comm.State = path
		Ansd = false
		timer.start()
	
	img = load(imgStr)
	Qus.set_texture(img)


func set_qustions_lables(path) -> void :
	#set Qus_arry
	Comm.Qus_arry = [[1,0],[2,0],[3,0],[4,0]]
	randomize()
	Comm.Qus_arry.shuffle()
	
	A.text = Comm.Answers[path]["1"]["Ans"]
	B.text = Comm.Answers[path]["2"]["Ans"]
	C.text = Comm.Answers[path]["3"]["Ans"]
	D.text = Comm.Answers[path]["4"]["Ans"]


################################################################################
#########################                                #######################
#########################              BUTTONS           #######################
#########################                                #######################
################################################################################

func _on_A_pressed():
	Ansd = "A"

func _on_B_pressed():
	Ansd = "B"

func _on_C_pressed():
	Ansd = "C"

func _on_D_pressed():
	Ansd = "D"



################################################################################
#########################                                #######################
#########################              STATES            #######################
#########################                                #######################
################################################################################

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Gujarat_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Gujarat")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Rajasthan_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Rajasthan")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Jammu_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Jammu Kashmir")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Himanchal_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Himanchal Pradesh")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Punjab_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Punjab")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Uttarakhand_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Uttarakhand")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Haryana_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Haryana")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Delhi_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Delhi")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Uttar_Pradesh_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Uttar Pradesh")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Madhya_Pradesh_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Madhya Pradesh")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Bihar_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Bihar")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Sikkim_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Sikkim")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Meghalaya_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Meghalaya")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Arunachal_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Arunachal Pradesh")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Assam_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Assam")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Nagaland_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Nagaland")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Manipur_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Manipur")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Tripura_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Tripura")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Mizoram_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Mizoram")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Jharkhand_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Jharkhand")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_West_Bengal_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("West Bengal")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Chhattisgarh_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Chhattisgarh")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Odisa_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Odisha")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Maharashtra_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Maharashtra")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Andhra_Pradesh_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Andhra Pradesh")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Goa_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Goa")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Karnataka_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Karnataka")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Tamil_Nadu_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Tamil Nadu")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Kerala_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Kerala")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Telangana_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Ansd == true:
				ShowImg("Telangana")
