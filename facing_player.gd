extends Node
@export var player : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child: Node3D in get_children():
		child.look_at(player.position)
		child.rotate_y(PI)
		child.rotation *= Vector3(0,1,0)
	pass # Replace with function body.
	
