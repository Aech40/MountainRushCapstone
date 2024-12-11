extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MainMenu/Start.grab_focus()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_focus_entered() -> void:
	$Hover.play()
func _on_start_mouse_entered() -> void:
	$Hover.play()
func _on_start_pressed() -> void:
	#SceneTransition.load_scene("res://level_select.tscn")
	$Click.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Screens/car_select.tscn")

func _on_options_focus_entered() -> void:
	$Hover.play()
func _on_options_mouse_entered() -> void:
	$Hover.play()
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Screens/options.tscn")


func _on_records_focus_entered() -> void:
	$Hover.play()
func _on_records_mouse_entered() -> void:
	$Hover.play()
func _on_records_pressed() -> void:
	get_tree().change_scene_to_file("res://Screens/records.tscn")

func _on_quit_focus_entered() -> void:
	$Hover.play()
func _on_quit_mouse_entered() -> void:
	$Hover.play()
func _on_quit_pressed() -> void:
	get_tree().quit()
