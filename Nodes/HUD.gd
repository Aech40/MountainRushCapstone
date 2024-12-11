extends CanvasLayer

@onready var lap_label: RichTextLabel = $"%LapLabel"
@onready var start_label: RichTextLabel = $"%StartLabel"
@onready var middle_panel: Panel = $"%MiddlePanel"
@onready var speed_label: Label = $"%SpeedLabel"
@onready var km_counter = $"%kilometers_counter"
@onready var win_screen = $"%WinScreen"


var lap_start = 0
var total_time = 0


var display_checkpoint = 0
var current_checkpoint = 0
var running = false


func _ready():
	lap_label.hide()

	middle_panel.hide()


func _process(delta):


	

	if running:
		total_time = Time.get_unix_time_from_system() - lap_start
		var str_elapsed = format_seconds(total_time)
		lap_label.text = "[right]time: " + str_elapsed + "[/right]"




func format_seconds(t)->String:
	var minutes = int(t) / 60
	var seconds = int(t) % 60
	return "%02d'%02d''" % [minutes, seconds]

func new_lap():
	lap_start = Time.get_unix_time_from_system()
	lap_label.show()
	running = true

func show_init():
	middle_panel.show()

func start():

	lap_label.show()


func update_timer(sec: float):

	if sec == 0:
		start_label.text = "[center]Start!"
		await get_tree().create_timer(0.5).timeout

		middle_panel.hide()
	else:
		start_label.text = "[center]" + str(sec) + "[/center]"

func update_checkpoint(sec: float):
	pass

func new_checkpoint(diff: float):
		current_checkpoint = diff
		display_checkpoint = 2

func game_over():
	middle_panel.hide()

	lap_label.hide()
	running = false
	

func finished():
	lap_label.hide()
	running = false
	print(total_time)
	if total_time < float(SaveLoad.bestTime):
			SaveLoad.saveScore(total_time)
	var best = SaveLoad.bestTime



	win_screen.show_win_screen(total_time, best)

func update_speed(speed_percent):

	var speed = snapped(CarChoice.speedo * speed_percent, 10)
	km_counter.set_kilo(speed)
