extends Node2D

onready var finish_area := $FinishLine
onready var player := $character

func _ready() -> void:
	finish_area.connect("body_entered", self, "_on_Finish_body_entered")

func finish_game() -> void:
	set_process(false)
	player.set_physics_process(false)

#func _on_Finish_body_entered(body: Node) -> void:
	#finish_game()
