extends CenterContainer

signal go_back
var finished = false


@onready var time_label = $"%TimeLabel"
@onready var best_label = $"%NewBestTimeLabel"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var toggle_timeout = 1




func show_win_screen(score, best):
	show()
	time_label.text = "Stage Time: " + format_time(score)
	if not best:
		
			#time_label.text += " / Best score: " + format_time(ScoreManager.current_best.total_time)
		best_label.modulate.a = 0
	finished = true

func format_time(score):
	var minutes = score / 60
	var seconds = int(score) % 60
	return "%02d'%02d''" % [minutes, seconds]

func _process(delta):
	toggle_timeout -= delta
	
	


func _input(event):
	if finished:
		if event is InputEventKey and event.pressed:
			await get_tree().create_timer(2.5).timeout
			emit_signal("go_back")
			
		if event is InputEventJoypadButton and event.pressed:
			await get_tree().create_timer(2.5).timeout
			emit_signal("go_back")
