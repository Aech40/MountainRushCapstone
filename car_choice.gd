extends Node

var carChoice=1
var levelChoice=0
var max_speed = Settings.SEGMENT_LENGTH * 80.0
var boost_quantity = 1.5
var max_boost_speed = max_speed*boost_quantity
var can_boost = true

var accel = max_speed/5
var decel = max_speed/5
var braking = max_speed
var speed = 0.0
var offroad_speed = max_speed/4
var offroad_decel = max_speed/2
var speedo= 180
func setChoice (newChoice):
	
	if newChoice ==2:
		carChoice=2
		max_speed = Settings.SEGMENT_LENGTH * 65.0
		boost_quantity = 1.5
		max_boost_speed = max_speed*boost_quantity
		can_boost = true

		accel = max_speed/2
		decel = max_speed/2
		braking = max_speed
		speed = 0.0
		offroad_speed = max_speed/2
		offroad_decel = max_speed/2
		speedo=160
func setLevelChoice(newLevelChoice):
	levelChoice=newLevelChoice
