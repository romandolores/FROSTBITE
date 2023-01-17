extends KinematicBody2D

onready var sprite := $ZombieTilesheet

const DIRECTION_TO_FRAME := {
	Vector2.DOWN: 0,
	Vector2.DOWN + Vector2.RIGHT: 1,
	Vector2.RIGHT: 2,
	Vector2.UP + Vector2.RIGHT: 1,
	 Vector2.UP: 22,
}

var speed = 120
var motion = Vector2.ZERO
var player = null

func _physics_process(delta):
	motion = Vector2.ZERO
	if player:
		motion = position.direction_to(player.position) * speed
		motion = move_and_slide(motion)
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction_key := direction.round()
	direction_key.x = abs(direction_key.x)
	if direction_key in DIRECTION_TO_FRAME:
		sprite.frame = DIRECTION_TO_FRAME[direction_key]
		sprite.flip_h = sign(direction.x) == -1


func _on_Area2D_body_entered(body):
	player = body
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	player = null
	pass # Replace with function body.
	
