extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.can_interact = true
	# Globals.time_flowing = true
	pass
	print(position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.can_interact:
		turnaround()
		look_down()
		open_menu()
	
	
var turn_deg = 0.0
func turnaround() -> void:
	if Input.is_action_just_pressed("look_left"):
		turn_deg += 90
	elif Input.is_action_just_pressed("look_right"):
		turn_deg -= 90
	else: return
	var tween = get_tree().create_tween().set_parallel(false)
	tween.tween_property(self, "rotation_degrees", Vector3(0,turn_deg,0), 0.1)
	
	
@export var look_trigger_down = 0.7 # How far down the mouse needs to be to turn the mouse down
@export var look_trigger_up = 0.55 # How far up the mouse needs to be to move the camera back up
@export var down_tilt_deg = 10 # The degrees to tilt the cam down
func look_down() -> void:
	var mouse_low = get_viewport().get_mouse_position().y / get_viewport().size.y  # number from 0-1 that describes how low the mouse is
	if look_trigger_down <= mouse_low and (int(turn_deg) % 360 == 0):
		var tween = get_tree().create_tween().set_parallel(false)
		tween.tween_property(self, "rotation_degrees", Vector3(-down_tilt_deg,turn_deg + 20,0), 0.1)
	elif rotation_degrees.x < 0 and look_trigger_up >= mouse_low:
		var tween = get_tree().create_tween().set_parallel(false)
		tween.tween_property(self, "rotation_degrees", Vector3(0,turn_deg,0), 0.1)

func open_menu() -> void:
	if Input.is_action_just_pressed("exit"):
		Globals.can_interact = false
		get_tree().change_scene_to_file("res://Main menu/MainMenu.tscn")
