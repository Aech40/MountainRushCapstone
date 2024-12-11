extends Control

@export var audio_bus_name = "Master"
@onready var _bus = AudioServer.get_bus_index(audio_bus_name)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
			if event.keycode == KEY_BACKSPACE:
				get_tree().change_scene_to_file("res://Screens/main_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var value = db_to_linear(AudioServer.get_bus_volume_db(_bus))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


	


func _on_fullscreen_toggled(button_pressed) -> void:
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear_to_db(value))


func _on_volume_mouse_exited() -> void:
	release_focus()
