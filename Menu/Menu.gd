extends Control

var exit = false
var scene_path_to_load

func _ready():
	set_process(true)
	$"MainMenu/CenterRow/Buttons/Start".grab_focus()
	for button in $MainMenu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	if scene_to_load == "exit":
		exit = true
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	if exit:
		get_tree().quit()
	get_tree().change_scene(scene_path_to_load)
		
func _process(_delta):
	if Input.is_action_pressed("key_exit"):
		get_tree().quit()
