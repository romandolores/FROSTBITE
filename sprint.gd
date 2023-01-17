extends Sprite

var SPEED := 200
var sprint_speed := 315
var normal_speed := 200

func _physics_process(delta):
	if Input.is_action_just_pressed("boost"):
		normal_speed = sprint_speed
		get_node("Timer").start()

func _on_Timer_timeout():
	normal_speed = SPEED
