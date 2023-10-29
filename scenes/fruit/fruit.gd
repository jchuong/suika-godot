extends RigidBody2D

var size : int = 1:
	set(value):
		size = value
		$Label.text = str(value)
		var scale = Vector2(1 + (size - 1) * 0.1, 1 + (size - 1) * 0.1)
		$CollisionShape2D.scale = scale
		$Sprite2D.scale = scale


func _ready():
	add_to_group('fruits')
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func remove():
	queue_free()


func _on_body_entered(body):
	if (body.is_in_group('fruits') && body.size == size):
		var newSize = size + 1
		newSize = clamp(newSize, 1, 6)
		size = newSize
		body.remove()
