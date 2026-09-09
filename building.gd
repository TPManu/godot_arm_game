extends AnimatableBody2D

var speed := 250.0

func _physics_process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x < -200:
		queue_free()

func destroy():
	get_parent().add_coins(10)
	queue_free()
	
