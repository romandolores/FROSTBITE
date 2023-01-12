extends Node2D

const TREES := [
	preload("MAP/Snow.tres/Terrain.png/Tree"),
]

onready var mask: TileMap = $Mask

func _ready() -> void:
	randomize()
	add_trees_on_grid()
	mask.visible = false

func get_random_tree() -> Sprite:
	var tree_random_index := randi() % TREES.size()
	return TREES[tree_random_index].instance()

func add_trees_on_grid() -> void:
	for cell in mask.get_used_cells():
		var tree := get_random_tree()
		add_child(tree)
		var tree_size := tree.scale * tree.texture.get_size()
		var available_space := mask.cell_size - tree_size
		var random_offset := Vector2(randf(), randf()) * available_space
		tree.position = mask.position + mask.map_to_world(cell) + random_offset
