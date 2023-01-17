extends KinematicBody2D

onready var sprite := $SoldierTilesheet

var normal_speed := 200

const DIRECTION_TO_FRAME := {
	Vector2.DOWN: 0,
	Vector2.DOWN + Vector2.RIGHT: 1,
	Vector2.RIGHT: 2,
	Vector2.UP + Vector2.RIGHT: 1,
	 Vector2.UP: 22,
}

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var velocity := direction * normal_speed
	move_and_slide(velocity)
	var direction_key := direction.round()
	direction_key.x = abs(direction_key.x)
	if direction_key in DIRECTION_TO_FRAME:
		sprite.frame = DIRECTION_TO_FRAME[direction_key]
		sprite.flip_h = sign(direction.x) == -1

