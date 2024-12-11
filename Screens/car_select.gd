extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()
	$Cars/Car2.grab_focus()
#	
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
			if event.keycode == KEY_BACKSPACE:
				get_tree().change_scene_to_file("res://Screens/main_menu.tscn")
func _process(delta: float) -> void:
	pass


func _on_car_1_pressed() -> void:
	# select car 1
	CarChoice.setChoice(1)
	get_tree().change_scene_to_file("res://Screens/level_select.tscn")
	


func _on_car_2_pressed() -> void:
	# select car 2
	CarChoice.setChoice(2)
	get_tree().change_scene_to_file("res://Screens/level_select.tscn")
	

func _on_car_3_pressed() -> void:
	# select car 3
	CarChoice.setChoice(3)
	get_tree().change_scene_to_file("res://Screens/level_select.tscn")
