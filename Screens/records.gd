extends Control
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
			if event.keycode == KEY_BACKSPACE:
				get_tree().change_scene_to_file("res://Screens/main_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SaveLoad.changeSaveFile("user://SaveData1.txt")
	SaveLoad.loadScore()
	var saveData1=SaveLoad.bestTime

	SaveLoad.changeSaveFile("user://SaveData2.txt")
	SaveLoad.loadScore()
	var saveData2=SaveLoad.bestTime

	SaveLoad.changeSaveFile("user://SaveData3.txt")
	SaveLoad.loadScore()
	var saveData3=SaveLoad.bestTime
	$"HBoxContainer/Stage 1/Label".text="Fastest Time:" + str(format_time(saveData1))
	$"HBoxContainer/Stage 2/Label".text="Fastest Time:" + str(format_time(saveData2))
	$"HBoxContainer/Stage 3/Label".text="Fastest Time:" + str(format_time(saveData3))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func format_time(score):
	var minutes = float(score) / 60
	var seconds = int(score) % 60
	return "%02d:%02d" % [minutes, seconds]
