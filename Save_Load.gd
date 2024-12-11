extends Node


var saveData = " "
#var time = 0
var bestTime 
func _ready() -> void:
	pass
	
func changeSaveFile (path):
	saveData=path
func saveScore(time):
	var file = FileAccess.open(saveData, FileAccess.WRITE_READ)
	file.store_string(str(time))
	file.close()


func loadScore():

	var file = FileAccess.open(saveData, FileAccess.READ)
	if FileAccess.file_exists(saveData):
		bestTime= file.get_as_text()
		file.close()
	else:
		print("ERROR")
