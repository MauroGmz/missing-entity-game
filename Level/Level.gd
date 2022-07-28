extends Node2D

func _ready():
	set_process(true)

func _physics_process(delta):
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()
	get_node("Background").scroll_base_offset += Vector2(0, 1) * 100 * delta
	#get_node("Stars1").scroll_base_offset += Vector2(0, 1) * 24 * delta
	get_node("Meteors1").scroll_base_offset += Vector2(-1, 1) * 500 * delta

func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://Menu/Menu.tscn")
