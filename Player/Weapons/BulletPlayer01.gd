extends Area2D

var speed = -650
var velocity = Vector2()

func _ready():
	$BulletRedSprite.play()

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(0, speed).rotated(rotation)

func _physics_process(delta):
	position += velocity * delta 
	
func hit():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
