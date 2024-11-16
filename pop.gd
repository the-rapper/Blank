extends Panel

@onready var connection_bar = get_node("Connection")
@onready var options = {
	"mooz": get_node("Mooz"),
	"drawer": get_node("Drawer")
	}
var chosen = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if chosen != null and (Input.is_action_just_pressed("exit") or Input.is_action_just_pressed("look_left") or Input.is_action_just_pressed("look_right")) :
		exit()
	pass
func exit():
	Globals.is_participating = false
	hide()
	connection_bar.hide()
	chosen.hide()
	chosen = null
	Globals.can_interact = true
func pop_up(option: String):
	Globals.is_participating = true
	show()
	chosen = options.get(option)
	chosen.show()
	connection_bar.show()
	if(chosen.has_method("begin")):
		Globals.can_interact = false
		chosen.begin()
	pass
