class_name Road extends Node


signal circuit_over


var segments = []
var track_length = 0
var cars = []
var current_checkpoint = 0

var checkpoints = []
var start_index = 0
var end_index = 0


var last_checkpoint_time = 20
func reset(player_pos: float):
	if CarChoice.levelChoice == 1:
		Settings.set_color()
		segments = []


		add_straight_road(Settings.ROAD_LENGTH.SHORT)
		add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.MEDIUM, 0, 0, Settings.ROAD_HILL.HIGH)
		add_road(0, Settings.ROAD_LENGTH.MEDIUM, 0, 0, Settings.ROAD_HILL.HIGH)
		add_road(0, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.SHORT, 0, Settings.ROAD_HILL.HIGH)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_large_turn(1)
		add_large_turn(1)
		add_medium_rolling_hills(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_HILL.HIGH)
		var bridge1_start = segments.size() - 1
		add_medium_rolling_hills(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_HILL.HIGH)
		for i in range(bridge1_start, segments.size()):
			if i % 10 == 0:
				segments[i].add_sprite("bridge", 0)
		add_large_turn(-1)
		add_large_turn(-1)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_medium_rolling_hills(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_HILL.HIGH)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_large_turn(1)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_climbing_curves(Settings.ROAD_HILL.LOW)
		add_large_turn(-1)
		add_large_turn(1)
		add_climbing_curves(Settings.ROAD_HILL.HIGH)
		add_low_rolling_hills(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_HILL.HIGH)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_large_turn(-1)
		add_large_turn(-1)
		add_low_rolling_hills(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_HILL.HIGH)
		add_s_curves2()
		add_more_roads()
		add_straight_road(Settings.ROAD_LENGTH.MEDIUM)
		add_straight_road(Settings.ROAD_LENGTH.MEDIUM)


		checkpoints.append({"time": 1, "index": segments.size() - 1, "end": true})


		add_straight_road(Settings.ROAD_LENGTH.LONG)



		track_length = segments.size() * Settings.SEGMENT_LENGTH

		start_index = segment_index(player_pos)

		segments[start_index].floor_indication = Color.WHITE
		for c in checkpoints:
			segments[c["index"]].floor_indication = Color.ALICE_BLUE
			segments[c["index"]].add_sprite("checkpoint", 0)


	addObsticles()
	if CarChoice.levelChoice == 2:
		Settings.set_color()
		segments = []

		add_straight_road(Settings.ROAD_LENGTH.SHORT)
		add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.MEDIUM, 0, 0, Settings.ROAD_HILL.HIGH)
		add_large_turn(1)
		add_large_turn(-1)
		add_road(0, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.SHORT, 0, Settings.ROAD_HILL.HIGH)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_large_turn(1)
		add_large_turn(1)
		var bridge1_start = segments.size() - 1
		add_large_turn(-1)
		add_large_turn(-1)
		for i in range(bridge1_start, segments.size()):
			if i % 10 == 0:
				segments[i].add_sprite("bridge", 0)
		add_large_turn(-1)
		add_large_turn(1)
		add_medium_rolling_hills(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_HILL.HIGH)
		add_straight_road(Settings.ROAD_LENGTH.MEDIUM)
		add_large_turn(1)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_climbing_curves(Settings.ROAD_HILL.HIGH)
		add_large_turn(-1)
		add_low_rolling_hills(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_HILL.HIGH)
		add_s_curves2()
		add_more_roads()
		add_large_turn(1)
		add_climbing_curves(Settings.ROAD_HILL.HIGH)
		add_low_rolling_hills(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_HILL.HIGH)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		
		add_large_turn(-1)
		add_large_turn(-1)
		
		
		add_straight_road(Settings.ROAD_LENGTH.MEDIUM)


		checkpoints.append({"time": 1, "index": segments.size() - 1, "end": true})


		add_straight_road(Settings.ROAD_LENGTH.LONG)



		track_length = segments.size() * Settings.SEGMENT_LENGTH

		start_index = segment_index(player_pos)

		segments[start_index].floor_indication = Color.WHITE
		for c in checkpoints:
			segments[c["index"]].floor_indication = Color.ALICE_BLUE
			segments[c["index"]].add_sprite("checkpoint", 0)
		addObsticles()
	if CarChoice.levelChoice == 3:
		Settings.set_color()
		segments = []

		
		add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.MEDIUM, 0, 0, Settings.ROAD_HILL.HIGH)
		add_large_turn(1)
		add_large_turn(-1)
		add_s_curves2()
		add_s_curves()
		add_straight_road(Settings.ROAD_LENGTH.MEDIUM)
		add_large_turn(1)
		add_large_turn(1)
		add_medium_rolling_hills(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_HILL.HIGH)
		add_straight_road(Settings.ROAD_LENGTH.MEDIUM)
		add_large_turn(1)
		add_straight_road(Settings.ROAD_LENGTH.LONG)
		add_climbing_curves(Settings.ROAD_HILL.HIGH)
		add_large_turn(-1)
		add_low_rolling_hills(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_HILL.HIGH)
		add_s_curves2()
		add_climbing_curves(Settings.ROAD_HILL.HIGH)
		add_large_turn(1)
		add_climbing_curves(Settings.ROAD_HILL.HIGH)
		add_low_rolling_hills(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_HILL.HIGH)
		add_straight_road(Settings.ROAD_LENGTH.MEDIUM)
		add_large_turn(-1)
		add_large_turn(-1)
		add_large_turn(1)
		add_large_turn(1)
		
		add_straight_road(Settings.ROAD_LENGTH.MEDIUM)


		checkpoints.append({"time": 1, "index": segments.size() - 1, "end": true})


		add_straight_road(Settings.ROAD_LENGTH.LONG)



		track_length = segments.size() * Settings.SEGMENT_LENGTH

		start_index = segment_index(player_pos)

		segments[start_index].floor_indication = Color.WHITE
		for c in checkpoints:
			segments[c["index"]].floor_indication = Color.ALICE_BLUE
			segments[c["index"]].add_sprite("checkpoint", 0)
		addObsticles()
	

func add_segment(curve, y):
	var n = segments.size()
	segments.append(Segment.new(last_segment_y(), y, n, curve))

func add_s_curves():
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.EASY)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_CURVE.MEDIUM)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_CURVE.EASY)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.EASY)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.MEDIUM)



func add_s_curves2():
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.HARD, Settings.ROAD_HILL.HIGH)
	add_road(0, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.HARD, Settings.ROAD_HILL.HIGH)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_CURVE.EASY, - Settings.ROAD_HILL.LOW)
	add_road(0, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.EASY, - Settings.ROAD_HILL.LOW)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.MEDIUM, Settings.ROAD_HILL.LOW)

func add_climbing_curves(height):
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_CURVE.EASY, height)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.MEDIUM, - height / 2)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_CURVE.EASY, - height)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_CURVE.EASY, 0)
	add_road(Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, Settings.ROAD_LENGTH.MEDIUM, - Settings.ROAD_CURVE.MEDIUM, height / 2)

func add_more_roads():
	add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, - Settings.ROAD_CURVE.HARD)
	add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_CURVE.HARD)
	add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, - Settings.ROAD_CURVE.HARD)
	add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_CURVE.HARD)

func add_low_rolling_hills(num, height):
	add_road(num, num, num, 0, height / 2)
	add_road(num, num, num, 0, - height)
	add_road(num, num, num, 0, height)
	add_road(num, num, num, 0, 0)
	add_road(num, num, num, 0, 0)

func add_medium_rolling_hills(num, height):
	add_road(num, num, num, 0, height)
	add_road(num, num, num, 0, - height * 2)
	add_road(num, num, num, 0, height)
	add_road(num, num, num, 0, height / 2)
	add_road(num, num, num, 0, - height / 2)

func add_climbing_hill():
	add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, 0, Settings.ROAD_HILL.HIGH)
	add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, 0, Settings.ROAD_HILL.HIGH)
	add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, 0, Settings.ROAD_HILL.HIGH)

func add_large_turn(dir):
	add_road(Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, 0, dir * Settings.ROAD_CURVE.HARD)
	add_road(0, Settings.ROAD_LENGTH.SHORT, 0, dir * Settings.ROAD_CURVE.HARD)
	add_road(0, Settings.ROAD_LENGTH.SHORT, 0, dir * Settings.ROAD_CURVE.HARD)
	add_road(0, Settings.ROAD_LENGTH.SHORT, Settings.ROAD_LENGTH.SHORT, dir * Settings.ROAD_CURVE.HARD)

func add_straight_road(num):
	add_road(num, num, num)

func add_road(enter, hold, leave, curve: = 0, y: = 0):
	var start_y = last_segment_y()
	var end_y = start_y + y * Settings.SEGMENT_LENGTH
	var total = float(enter + hold + leave)

	for n in range(enter):
		add_segment(ease_in(0, curve, n / enter), ease_in_out(start_y, end_y, float(n) / total))

	for n in range(hold):
		add_segment(curve, ease_in_out(start_y, end_y, float(n + enter) / total))

	for n in range(leave):
		add_segment(ease_in_out(curve, 0, n / leave), ease_in_out(start_y, end_y, float(n + hold + enter) / total))



func find_segment(z):
	return segments[int(floor(z / Settings.SEGMENT_LENGTH)) % segments.size()]

func segment_index(z):
	return int(floor(z / Settings.SEGMENT_LENGTH)) % segments.size()

func ease_in(a, b, percent):
	return a + (b - a) * pow(percent, 2)

func ease_out(a, b, percent):
	return a + (b - a) * (1 - pow(1 - percent, 2))

func ease_in_out(a, b, percent):
	return a + (b - a) * (( - cos(percent * PI) / 2) + 0.5)


func last_segment_y():
	if segments.size() == 0:
		return 0
	else:
		return segments[segments.size() - 1].p2.world.y

func reset_cars():
	cars = []



func on_new_segment(index: int, total_time: float):

	for checkpoint in checkpoints:
		if checkpoint["index"] == index:
			if checkpoint["end"]:
				emit_signal("circuit_over")
			else:

				checkpoint["completed_in"] = total_time
				print("Completed checkpoint in " + str(checkpoint["completed_in"]))
				current_checkpoint += 1
				emit_signal("circuit_over")
			break
func addObsticles():
	for i in segments.size():
			if segments[i].left_side == Segment.SIDE_TYPE.None:
				continue

			if i % 5 == 0:

				if randf() > 0.7:

					var offset = sign(randf_range(-1, 1)) * randf_range(1.5, 4)
					if offset != 0:

						segments[i].add_sprite("bush", offset)


				if randf() > 0.7:
					var offset = sign(randf_range(-1, 1)) * randf_range(1.5, 4)
					if offset != 0:

						segments[i].add_sprite("bush", offset)

				if randf() > 0.7:
					var offset = sign(randf_range(-1, 1)) * randf_range(1.5, 4)
					if offset != 0:

						segments[i].add_sprite("bush", offset)

			if i % 15 == 0:

				if randf() > 0.7:

					var offset = sign(randf_range(-1, 1)) * randf_range(1.5, 4)
					if offset != 0:

						segments[i].add_sprite("palmtree", offset)


				if randf() > 0.7:
					var offset = sign(randf_range(-1, 1)) * randf_range(1.5, 4)
					if offset != 0:

						segments[i].add_sprite("palmtree", offset)

				if randf() > 0.7:
					var offset = sign(randf_range(-1, 1)) * randf_range(1.5, 4)
					if offset != 0:

						segments[i].add_sprite("palmtree", offset)
	
