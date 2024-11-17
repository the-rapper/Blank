extends Panel

@export var popups : Panel


var pressed = false
var inMooz = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Camera update in here maybe?
	# Probs viewport cmaer, may be that though
	if inMooz:
		if Input.is_action_just_pressed("Leave Zoom"):
			inMooz = false
			end()
		if Input.is_action_just_pressed("Mute"):
			pass
		if Input.is_action_just_pressed("Camera"):
			pass
		#if Input.is_action_just_pressed("interact"):
			#pressed = true
		#if Input.is_action_just_released("interact") and pressed:
			#pressed = false
			#end()
	pass

func begin():
	# Displays the screen
	Globals.is_participating = true
	inMooz = true
	pass




func end():
		Globals.is_participating = false
		inMooz = false
		popups.exit()
