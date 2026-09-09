extends CharacterBody2D

var vertical_speed := 500.0

func _process(delta):
	var target_y = get_viewport().get_mouse_position().y

	velocity.y = (target_y - position.y) * 5.0
	velocity.y = clamp(velocity.y, -vertical_speed, vertical_speed)

	move_and_slide()

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider.has_method("destroy"):
			collider.destroy()
