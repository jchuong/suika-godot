extends Node

@export var fruit_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func generate_fruit():
	var fruit = fruit_scene.instantiate()
	fruit.position = Vector2(randf_range(10.0, 400), 0)
	var size = randi_range(1, 4)
	fruit.size = size
	add_child(fruit)
