extends Node

var fruit_factory_scene = preload("res://scenes/fruit_factory/fruit_factory.tscn")
var fruit_factory

# Called when the node enters the scene tree for the first time.
func _ready():
	fruit_factory = fruit_factory_scene.instantiate()
	add_child(fruit_factory)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func start_game():
	$Timer.start()

func start():
	fruit_factory.generate_fruit()
