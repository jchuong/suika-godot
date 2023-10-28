extends RigidBody2D

var size = 1
signal hit
# Called when the node enters the scene tree for the first time.

func _setMask():
	for i in 9:
		set_collision_layer_value(i + 1, i == size)
		set_collision_mask_value(i + 1, i == size)

func _ready():
	size = 1
	show()
#	_setMask()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func remove():
	queue_free()


func _on_body_entered(body):
	if (body is RigidBody2D && body.size == size):
		size += 1
		size = clamp(size, 1, 9)
		body.remove()
		$Label.text = str(size)
		$CollisionShape2D.scale = Vector2(size, size)
		$Sprite2D.scale = Vector2(size, size)
