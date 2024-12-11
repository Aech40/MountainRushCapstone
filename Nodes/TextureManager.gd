# Class to hold all textures for a level.
extends Node
class_name TextureManager

var dict = {}
var sprite_scale = 1
var player_w = 1.0

func _ready():
	load_player()
	

func load_player():
	var player_texture 
	if CarChoice.carChoice==1:
		player_texture = load("res://assets/Sprites/player.png")
	elif CarChoice.carChoice==2:
		player_texture = load("res://assets/Sprites/player2.png")
	
	var player_sprite = MySprite.new(player_texture, 1, 8)
	dict["player"] = player_sprite
	sprite_scale = 0.3 / player_sprite.get_width()
	player_w = 0.3

	var playerlight_sprite
	if CarChoice.carChoice==1:
		playerlight_sprite= MySprite.new(load("res://assets/Sprites/player_lights.png"), 1, 8)
	elif CarChoice.carChoice==2:
		playerlight_sprite= MySprite.new(load("res://assets/Sprites/player_lights2.png"), 1, 8)
	 
	playerlight_sprite.modulate = Color(1.8, 1.8, 1.8, 1.0)
	dict["player_lights"] = playerlight_sprite

func get_texture(name: String) -> MySprite:
	if name in dict:
		return dict[name]
	return null

func load_level1():
	var sky = load("res://assets/Background/sky.png")
	var moon = load("res://assets/Background/moon.png")
	var hillsBack = load("res://assets/Background/hills_back.png")
	var hills = load("res://assets/Background/hills_front2.png")
	var sea = load("res://assets/Background/sea.png")
	$"../Background/Sky".texture=sky
	$"../Background/Moon".texture=moon
	$"../Background/HillsBack".texture=hillsBack
	$"../Background/Hills".texture=hills
	$"../Background/Sea".texture=sea
	dict["billboard_02"] = MySprite.new(load("res://assets/Background/billboard02.png"), 1, 1)

	dict["palmtree"] =  MySprite.new(load("res://assets/Road/palmtree.png"), 1, 1)
	dict["palmtree"].collider_width = 40

	dict["bush"] =  MySprite.new(load("res://assets/Background/bush.png"), 1, 1)
	dict["building1"] =  MySprite.new(load("res://assets/Road/building1.png"), 1, 1)

	dict["building2"] =  MySprite.new(load("res://assets/Road/building2.png"), 1, 4)

	dict["checkpoint"] = MySprite.new(load("res://assets/Background/checkpoint.png"), 1, 1)
	dict["checkpoint"].collision = false
	dict["bridge"] = MySprite.new(load("res://assets/Background/bridge.png"), 1, 1)
	dict["bridge"].collision = false
	dict["bridge"].modulate = Color(1.8, 1.8, 1.8, 1.0)
func load_level2():
	
	var sky = load("res://assets/Background/sky2.png")
	var moon = load("res://assets/Background/sun.png")
	var hillsBack = load("res://assets/Background/snow_hills_back.png")
	var hills = load("res://assets/Background/snow_hills_front2 copy.png")
	var sea = load("res://assets/Background/sea.png")
	$"../Background/Sky".texture=sky
	$"../Background/Moon".texture=moon
	$"../Background/HillsBack".texture=hillsBack
	$"../Background/Hills".texture=hills
	$"../Background/Sea".texture=sea
	dict["billboard_02"] = MySprite.new(load("res://assets/Background/billboard02.png"), 1, 1)

	dict["palmtree"] =  MySprite.new(load("res://assets/Background/snowman.png"), 1, 1)
	dict["palmtree"].collider_width = 40

	dict["bush"] =  MySprite.new(load("res://assets/Background/snowpile.png"), 1, 1)
	dict["building1"] =  MySprite.new(load("res://assets/Road/building1.png"), 1, 1)

	dict["building2"] =  MySprite.new(load("res://assets/Road/building2.png"), 1, 4)

	dict["checkpoint"] = MySprite.new(load("res://assets/Background/checkpoint.png"), 1, 1)
	dict["checkpoint"].collision = false
	dict["bridge"] = MySprite.new(load("res://assets/Background/bridge.png"), 1, 1)
	dict["bridge"].collision = false
	dict["bridge"].modulate = Color(1.8, 1.8, 1.8, 1.0)
func load_level3():
		
	
	var sky = load("res://assets/Background/sky3.png")
	var moon = load("res://assets/Background/moon3.png")
	var hillsBack = load("res://assets/Background/hills_back3.png")
	var hills = load("res://assets/Background/hills_front3.png")
	var sea = load("res://assets/Background/sea.png")
	$"../Background/Sky".texture=sky
	$"../Background/Moon".texture=moon
	$"../Background/HillsBack".texture=hillsBack
	$"../Background/Hills".texture=hills
	$"../Background/Sea".texture=sea
	dict["billboard_02"] = MySprite.new(load("res://assets/Background/billboard02.png"), 1, 1)

	dict["palmtree"] =  MySprite.new(load("res://assets/Background/pole.png"), 1, 1)
	dict["palmtree"].collider_width = 40

	dict["bush"] =  MySprite.new(load("res://assets/Background/traffic_cone.png"), 1, 1)
	dict["building1"] =  MySprite.new(load("res://assets/Road/building1.png"), 1, 1)

	dict["building2"] =  MySprite.new(load("res://assets/Road/building2.png"), 1, 4)

	dict["checkpoint"] = MySprite.new(load("res://assets/Background/checkpoint.png"), 1, 1)
	dict["checkpoint"].collision = false
	dict["bridge"] = MySprite.new(load("res://assets/Background/bridge.png"), 1, 1)
	dict["bridge"].collision = false
	dict["bridge"].modulate = Color(1.8, 1.8, 1.8, 1.0)
