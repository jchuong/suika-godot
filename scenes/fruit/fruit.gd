extends RigidBody2D

var size : int = 1:
	set(value):
		size = value
		$Label.text = str(value)
		$CollisionShape2D.scale = Vector2(size, size)
		$Sprite2D.scale = Vector2(size, size)


func _setMask():
	for i in 9:
		set_collision_layer_value(i + 1, i == size)
		set_collision_mask_value(i + 1, i == size)


func _ready():
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func remove():
	queue_free()


func _on_body_entered(body):
	if (body is RigidBody2D && body.size == size):
		var newSize = size + 1
		newSize = clamp(newSize, 1, 6)
		size = newSize
		body.remove()
