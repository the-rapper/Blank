extends Sprite3D
@export var player : Node3D

@onready var animator = get_node("AnimationPlayer")
var rustles = 10
var move_tween
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enter()
	pass # Replace with function body.

func enter() -> void:
	move_tween = get_tree().create_tween()
	animator.play("walk")
	#position = get_parent().position - Vector3(3,0,0)
	move_tween.tween_property(self, "position", Vector3(player.position.x, player.position.y, position.z) , 10)
	var stand = func() : animator.play("Stand")
	move_tween.tween_callback(stand)
func exit() -> void:
	animator.play("walk")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector3(0,0,0), 1)
	var leave = func () : tween.tween_property(self, "position", get_parent().position + Vector3(5,0,0), 1)
	tween.tween_callback(leave)
	var reset = func () : position = Vector3(1.49,-1.684,-1.05)
	tween.tween_callback(reset)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	look_at(player.position)
	rotate_y(PI)
	rotation *= Vector3(0,1,0)
	if rustles <= 0 and move_tween:
		move_tween.kill()
		rustles = 10
	pass
