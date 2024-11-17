extends Node
var can_interact = false
var time_flowing = false

var participation = 10
var is_camera_on = true
var is_mic_on = true
var is_participating = false
var since_participated = 0

var call_time = 0
const END_TIME = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# add or subtract participation
	if is_participating:
		since_participated = 0
		if is_camera_on and is_mic_on:
			participation += delta
			if participation > 100:
				participation = 100
	else:
		since_participated += delta
		if since_participated > 10:
			participation -= delta
			if participation < 0:
				get_tree().change_scene_to_file("res://DisconnectScreen.tscn")
	# call time tracker
	if time_flowing:
		call_time += delta
		if call_time > END_TIME:
			get_tree().change_scene_to_file("res://WinScreen.tscn")
	pass

func turn_camera_on() -> void:
	is_camera_on = true
	if is_mic_on:
		is_participating = true

func turn_mic_on() -> void:
	is_mic_on = true
	if is_camera_on:
		is_participating = true
