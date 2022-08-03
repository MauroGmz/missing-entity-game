extends Node2D

var opacityStars = 255
var opacityStars2 = 200
var speed = 1
func _ready():
	set_process(true)

func _physics_process(delta):
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()
	speed_background()
	get_node("Background").scroll_base_offset += Vector2(0, 1) * (130/speed) * delta
	get_node("Stars1").scroll_base_offset += Vector2(0, 1) * (170/speed) * delta
	get_node("Stars2").scroll_base_offset += Vector2(0, 1) * (100/speed) * delta
	get_node("Meteors1").scroll_base_offset += Vector2(-1, 1) * 500 * delta
	get_node("Stars1/ParallaxLayer/SpriteStarts").modulate.a8 = opacityStars
	get_node("Stars1/ParallaxLayer/SpriteStarts2").modulate.a8 = opacityStars
	get_node("Stars2/ParallaxLayer/SpriteStarts3").modulate.a8 = opacityStars2
	opacityStars -= 5
	opacityStars2 -= 1
	if opacityStars < 190:
		opacityStars = 255
	if opacityStars2 < 170:
		opacityStars2 = 255

func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://Menu/Menu.tscn")

func speed_background():
	if Input.is_action_pressed("player_down"):
		speed = 2.4
	elif Input.is_action_pressed("player_up"):
		speed = 0.6
	else:
		speed = 1
