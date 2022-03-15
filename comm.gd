extends Node

var Qus_arry = [[0,0],[0,0],[0,0],[0,0]] # Qus_arry[[qustion_no,answered],"","",""] :::: 0=default, 1=right, 2=wrong, 3=timeout
var qus_num = 0
var Score = 0
var Answers
var State

func _ready():
	var file = File.new()
	file.open("res://Answers.json",file.READ)
	var text = file.get_as_text()
	Answers = parse_json(text)
	file.close()

func reset_game():
	Qus_arry = [0,0,0,0]
	qus_num = 0
	Score = 0
	State = 0
