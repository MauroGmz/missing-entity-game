extends KinematicBody2D

const SPEED = 600
onready var motion = Vector2.ZERO
const rotation_speed = 5
var rotation_dir = 0
var bullet_res = null

onready var screensize = get_viewport_rect().size
	
func _ready():
	bullet_res = preload("res://Player/Weapons/BulletPlayer01.tscn")
	$Ship.play()
	
func _physics_process(delta):
	motion_ctrl()
	get_input()
	animation_ctrl()
	rotation += rotation_dir * rotation_speed * delta
	motion = move_and_collide(motion * delta)
	
		
func get_axis() -> Vector2:
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("player_right")) - int(Input.is_action_pressed("player_left"))
	axis.y = int(Input.is_action_pressed("player_down")) - int(Input.is_action_pressed("player_up"))
	return axis

func animation_ctrl():
	if get_axis() == Vector2.ZERO:
		$Ship.animation = "still"
	else:
		$Ship.animation = "normal"

func motion_ctrl():
	if get_axis() == Vector2.ZERO:
		motion = Vector2.ZERO
	else: 
		motion = get_axis().normalized() * SPEED
		
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
func get_input():
	rotation_dir = 0
	if Input.is_action_just_pressed("player_shot"):
		shot()
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
		
func shot():
	var b = bullet_res.instance()
	b.start($Canon.global_position, rotation)
	get_parent().add_child(b)
