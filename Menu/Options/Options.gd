extends Control

func _ready():
	set_process(true)

func _process(_delta):
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://Menu/Menu.tscn")


func _on_Back_pressed():
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FullScreenCheck_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
