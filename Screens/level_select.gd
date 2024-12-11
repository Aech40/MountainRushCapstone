extends Control


 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	


	#initializing level 1 save data 
	SaveLoad.changeSaveFile("user://SaveData1.txt")
	if !FileAccess.file_exists(SaveLoad.saveData):
			SaveLoad.saveScore(1000)
	SaveLoad.loadScore()
	var saveData1=SaveLoad.bestTime
	print(saveData1)
	#initializing level 2 save data
	SaveLoad.changeSaveFile("user://SaveData2.txt")
	if !FileAccess.file_exists(SaveLoad.saveData):
			SaveLoad.saveScore(1000)
	SaveLoad.loadScore()
	var saveData2=SaveLoad.bestTime
	#initializing level 3 save data  
	SaveLoad.changeSaveFile("user://SaveData3.txt")
	if !FileAccess.file_exists(SaveLoad.saveData):
			SaveLoad.saveScore(1000)
	SaveLoad.loadScore()
	
	#checking each score to unlock the level 
	var stage1PassTime=120
	var stage2PassTime=120
	
	if (stage1PassTime < float(saveData1)or saveData1==""):
		$Levels/VBoxContainer2/Stage2.disabled= true
		$Levels/VBoxContainer2/Label.visible= true
		$Levels/VBoxContainer2/Label.text= "Achieve a " + format_time(stage1PassTime) + " or less on Speedy Sands to unlock this stage."
	else:
		$Levels/VBoxContainer2/Stage2.disabled= false
	if (stage2PassTime < int(saveData2) or saveData2==""):
		$Levels/VBoxContainer3/Stage3.disabled= true
		$Levels/VBoxContainer3/Label.visible= true
		$Levels/VBoxContainer3/Label.text= "Achieve a " + format_time(stage2PassTime) + " or less on Alpine Apex to unlock this stage."
	else:
		$Levels/VBoxContainer3/Stage3.disabled= false
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
			if event.keycode == KEY_BACKSPACE:
				
				get_tree().change_scene_to_file("res://Screens/car_select.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_stage_1_pressed() -> void:
	CarChoice.setLevelChoice(1)
	get_tree().change_scene_to_file("res://Nodes/Game.tscn")


func _on_stage_2_pressed() -> void:
	CarChoice.setLevelChoice(2)
	get_tree().change_scene_to_file("res://Nodes/Game.tscn")


func _on_stage_3_pressed() -> void:
	CarChoice.setLevelChoice(3)
	get_tree().change_scene_to_file("res://Nodes/Game.tscn")
func format_time(score):
	var minutes = float(score) / 60
	var seconds = int(score) % 60
	return "%02d:%02d" % [minutes, seconds]
