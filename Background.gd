extends Node2D

@onready var sky = $Sky
@onready var hills = $Hills
@onready var hills_back = $HillsBack
@onready var sea = $Sea
var hillsBackSpeed = 0.5
var hillSpeed = 0.8


func _ready():
	pass



func adjust_offsets(speed_percent, curve):
	hills_back.position.x = hills_back.position.x + hillsBackSpeed * speed_percent * curve
	hills.position.x = hills.position.x + hillSpeed * speed_percent * curve

func set_sea_level(maxy):
	sea.global_position.y = maxy
