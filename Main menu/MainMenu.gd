extends Control

@onready var background_layer = get_node("ParallaxBackground")
@onready var title = get_node("TitleLabel")
@onready var menu_container = get_node("MarginContainer/MenuItems")
@onready var animation_player = get_node("AnimationPlayer")
@onready var transition_overlay = get_node("TransitionOverlay")

func _ready():
	print("Looking for buttons...")
	
	# Updated paths to match your scene tree
	var start_button = get_node("MarginContainer/MenuItems/StartButton")
	var settings_button = get_node("MarginContainer/MenuItems/SettingsButton")
	var quit_button = get_node("MarginContainer/MenuItems/QuitButton")
	
	# Debug prints for node finding
	print("Animation Player found: ", animation_player != null)
	print("Transition Overlay found: ", transition_overlay != null)
		
	# Debug prints
	if start_button:
		print("Start button found")
		start_button.pressed.connect(_on_start_pressed)
	else:
		print("Start button not found!")
		print("Path attempted: ", $MarginContainer/MenuItems/StartButton)

	# Connect pressed signals
	if start_button:
		print("Start button found")
		start_button.pressed.connect(_on_start_pressed)
		start_button.mouse_entered.connect(func(): _on_button_hover(start_button))
		start_button.mouse_exited.connect(func(): _on_button_normal(start_button))
	
	if settings_button:
		print("Settings button found")
		settings_button.pressed.connect(_on_settings_pressed)
		settings_button.mouse_entered.connect(func(): _on_button_hover(settings_button))
		settings_button.mouse_exited.connect(func(): _on_button_normal(settings_button))
	
	if quit_button:
		print("Quit button found")
		quit_button.pressed.connect(_on_quit_pressed)
		quit_button.mouse_entered.connect(func(): _on_button_hover(quit_button))
		quit_button.mouse_exited.connect(func(): _on_button_normal(quit_button))

func _on_button_hover(button: Button):
	var tween = create_tween()
	tween.tween_property(button, "scale", Vector2(1.1, 1.1), 0.1)

func _on_button_normal(button: Button):
	var tween = create_tween()
	tween.tween_property(button, "scale", Vector2(1.0, 1.0), 0.1)

func _on_start_pressed():
	print("Start button pressed!")
	Globals.can_interact = true
	transition_to_scene("res://node_3d.tscn")

func _on_settings_pressed():
	print("Settings pressed!")
	transition_to_scene("res://scenes/settings.tscn")
	
	

func transition_to_scene(next_scene: String):
	print("Trying to transition to: ", next_scene)
	if animation_player:
		if animation_player.has_animation("fade_to_black"):
			animation_player.play("fade_to_black")
			await animation_player.animation_finished
			get_tree().change_scene_to_file(next_scene)
		else:
			print("No fade_to_black animation found!")
			get_tree().change_scene_to_file(next_scene)
	else:
		print("No AnimationPlayer found!")
		get_tree().change_scene_to_file(next_scene)

func _on_quit_pressed():
	print("Quit pressed!")
	if animation_player:
		animation_player.play("fade_to_black")
		await animation_player.animation_finished
	get_tree().quit()
