extends Node2D

var coins := 0
var ground_y := 527.0

@onready var coin_label = $CoinLabel
@onready var building_scene = preload("res://building.tscn")

func _ready():
	$BuildingTimer.timeout.connect(spawn_building)

func add_coins(amount):
	coins += amount
	coin_label.text = "Coins: " + str(coins)

func spawn_building():
	var building = building_scene.instantiate()

	var random_y = randf_range(250.0, 500.0)
	building.position = Vector2(900, ground_y)

	add_child(building)
