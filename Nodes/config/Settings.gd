extends Node


var debug = true


const SEGMENT_LENGTH = 200

const RUMBLE_LENGTH = 3

const WIDTH = 1280
const HEIGHT = 960
const LANES = 1
const ROAD_WIDTH = 750




const CENTRIFUGAL_FORCE = 0.3

var COLORS_LIGHT = {
	"road": Color("#000000"), 
	"grass": Color("#000000"), 
	"rumble": Color("#000000"), 
	"lane": Color("#000000"), 
	"water": Color.BLUE, 
}

var COLORS_DARK = {
	"road": Color("#000000"), 
	"grass": Color("#000000"), 
	"rumble": Color("#000000"), 
	"water": Color("#000000"), 
}
func set_color():
	if CarChoice.levelChoice == 1:
		COLORS_LIGHT = {
			"road": Color("#5a3e1a"), 
			"grass": Color("#b8b167"), 
			"rumble": Color("#443310"), 
			"lane": Color("#CCCCCC"), 
			"water": Color("#0a50c2"), 
		}

		COLORS_DARK = {
			"road": Color("#443310"), 
			"grass": Color("#9c9660"), 
			"rumble": Color("#5a3e1a"), 
			"water": Color("#0a50c2"), 
	}
	if CarChoice.levelChoice == 2:
		COLORS_LIGHT = {
			"road": Color("#dbdbdb"), 
			"grass": Color("#fcfcfa"), 
			"rumble": Color("#f50505"), 
			"lane": Color("#b5963f"), 
			"water": Color("#0a50c2"), 
		}

		COLORS_DARK = {
			"road": Color("#fcfafa"), 
			"grass": Color("#ebebeb"), 
			"rumble": Color("#adacaa"), 
			"water": Color("#0a50c2"), 
	}
	if CarChoice.levelChoice == 3:
		COLORS_LIGHT = {
			"road": Color("#03010f"), 
			"grass": Color("#03010f"), 
			"rumble": Color("#03010f"), 
			"lane": Color("#CCCCCC"), 
			"water": Color("#0a50c2"), 
		}

		COLORS_DARK = {
			"road": Color("#03010f"), 
			"grass": Color("#03010f"), 
			"rumble": Color("#1b1b1c"), 
			"water": Color("#0a50c2"), 
	}


enum ROAD_LENGTH{
	NONE = 0, 
	SHORT = 25, 
	MEDIUM = 50, 
	LONG = 100
}

enum ROAD_CURVE{
	NONE = 0, 
	EASY = 2, 
	MEDIUM = 4, 
	HARD = 6
}

enum ROAD_HILL{
	NONE = 0, 
	LOW = 20, 
	MEDIUM = 40, 
	HIGH = 60
}


enum PLAYER_COORD{
	STRAIGHT = 0, 
	STRAIGHT_LEFT = 1, 
	DRIFT_RIGHT, 
	STRAIGHT_RIGHT, 
	UP, 
	UP_LEFT, 
	UP_RIGHT, 
	DRIFT_LEFT
}

func rumble_width(projected_road_width: float):
	return projected_road_width / max(6, 3 * LANES)

func lane_marker_width(projected_road_width: float):
	return projected_road_width / max(32, 8 * LANES)



func draw_rectangle(node_2d: Node2D, x1, y1, w1, x2, y2, w2, color):
	var p1_left = Vector2(x1 - w1, y1)
	var p1_right = Vector2(x1 + w1, y1)
	var p2_left = Vector2(x2 - w2, y2)
	var p2_right = Vector2(x2 + w2, y2)
	var array = PackedVector2Array()

	array.push_back(p1_left)
	array.push_back(p1_right)
	array.push_back(p2_right)
	array.push_back(p2_left)
	if not Geometry2D.triangulate_polygon(array).is_empty():
		node_2d.draw_colored_polygon(array, color)

func draw_textured_rectangle(node_2d: Node2D, x1, y1, w1, x2, y2, w2, texture):
	var p1_left = Vector2(x1 - w1, y1)
	var p1_right = Vector2(x1 + w1, y1)
	var p2_left = Vector2(x2 - w2, y2)
	var p2_right = Vector2(x2 + w2, y2)
	var array = PackedVector2Array()

	array.push_back(p1_left)
	array.push_back(p1_right)
	array.push_back(p2_right)
	array.push_back(p2_left)

	var colors = PackedColorArray()
	colors.append(Color.WHITE)
	colors.append(Color.WHITE)
	colors.append(Color.WHITE)
	colors.append(Color.WHITE)

	var uvs = PackedVector2Array()
	uvs.append(Vector2(0, 0))
	uvs.append(Vector2(1, 0))
	uvs.append(Vector2(1, 1))
	uvs.append(Vector2(0, 1))
	if not Geometry2D.triangulate_polygon(array).is_empty():
		node_2d.draw_polygon(array, colors, uvs, texture)
