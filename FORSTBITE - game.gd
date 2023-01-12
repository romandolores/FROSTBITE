extends Node2D


onready var godot := $Course/Godot

onready var ui_remaining_time := $CanvasLayer/RemainingTime

onready var timer := $Timer

onready var finish_area := $Course/FinishLine

onready var info_label := $CanvasLayer/Info


func _ready() -> void:
	set_physics_process(false)
	ui_remaining_time.text = get_time_as_text(timer.wait_time)
	set_process(false)
	finish_area.connect("body_entered", self, "_on_Finish_body_entered")
	timer.connect("timeout", self, "finish_game")

func _process(delta: float) -> void:
	ui_remaining_time.text = get_time_as_text(timer.time_left)

func start() -> void:
	set_physics_process(true)
	timer.start()
	set_process(true)

func finish_game() -> void:
	set_process(false)
	godot.set_physics_process(false)
	info_label.rect_scale = Vector2.ONE
	info_label.get_font("font").size = 128
	info_label.show()
	info_label.text = "You lost!"
	var player_has_won : float = timer.time_left > 0.0
	if player_has_won:
		var player_time : float = timer.wait_time - timer.time_left
		info_label.text = "You won!\nTime: " + get_time_as_text(player_time)
	timer.stop()


func get_time_as_text(time: float) -> String:
	return str(time).pad_decimals(2).pad_zeros(2)

func _on_Finish_body_entered(body: Node) -> void:
	finish_game()
