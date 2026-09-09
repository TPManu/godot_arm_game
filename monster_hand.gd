extends CharacterBody2D

@export var max_distance: float = 250.0
@export var follow_speed: float = 8.0

@export var minimum_swipe_distance: float = 75.0

@export var punch_distance: float = 200.0
@export var punch_speed: float = 1200.0

@export var slam_distance: float = 300.0
@export var slam_speed: float = 1400.0

enum AttackType {
	NONE,
	PUNCH,
	SLAM
}

var swipe_start: Vector2

var is_attacking: bool = false
var current_attack: AttackType = AttackType.NONE

var attack_target: Vector2


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			swipe_start = event.position

		else:
			var swipe_end = event.position
			var swipe = swipe_end - swipe_start

			if swipe.x > minimum_swipe_distance and abs(swipe.x) > abs(swipe.y):
				start_punch()

			elif swipe.y > minimum_swipe_distance and abs(swipe.y) > abs(swipe.x):
				start_slam()


func _physics_process(_delta):
	if is_attacking:
		handle_attack()
	else:
		follow_mouse()

	move_and_slide()

	if is_attacking:
		check_for_building_collision()
		check_attack_collision()


func follow_mouse():
	var mouse_position = get_global_mouse_position()
	var monster_position = get_parent().global_position

	var direction = mouse_position - monster_position

	if direction.length() > max_distance:
		direction = direction.normalized() * max_distance

	var target_position = monster_position + direction

	velocity = (target_position - global_position) * follow_speed


func start_punch():
	is_attacking = true
	current_attack = AttackType.PUNCH

	attack_target = global_position + Vector2.RIGHT * punch_distance


func start_slam():
	is_attacking = true
	current_attack = AttackType.SLAM

	attack_target = global_position + Vector2.DOWN * slam_distance


func handle_attack():
	var direction = attack_target - global_position

	if direction.length() < 10.0:
		end_attack()
		return

	if current_attack == AttackType.PUNCH:
		velocity = direction.normalized() * punch_speed

	elif current_attack == AttackType.SLAM:
		velocity = direction.normalized() * slam_speed


func check_attack_collision():
	if current_attack != AttackType.SLAM:
		return

	if get_slide_collision_count() > 0:
		end_attack()


func check_for_building_collision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider.has_method("destroy"):
			collider.destroy()


func end_attack():
	is_attacking = false
	current_attack = AttackType.NONE
	velocity = Vector2.ZERO
