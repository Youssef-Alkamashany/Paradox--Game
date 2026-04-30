extends Node
class_name BrickSpawner

const COLUMNS = 20
const ROWS = 8

@onready var ball = $"../Ball"
@onready var ui = $"../UI"

@export var brick_scene: PackedScene
@export var margin: Vector2 = Vector2(8, 8)
@export var spawn_start: Marker2D

var brick_count = 0

func _ready():
	spawn()

func spawn():
	var test_brick = brick_scene.instantiate()
	add_child(test_brick)

	var brick_size = test_brick.get_size()
	test_brick.queue_free()

	var spawn_position_y = spawn_start.position.y

	for i in range(ROWS):

		# 🟢 حساب عدد البلوكات لكل صف (شكل ماسة)
		var mid = ROWS / 2
		var distance = abs(i - mid)
		var bricks_in_row = COLUMNS - int(distance) * 2

		# 🟢 تحديد بداية الصف بحيث يكون في النص
		var row_width = bricks_in_row * brick_size.x + (bricks_in_row - 1) * margin.x
		var start_x = -row_width / 2

		for j in range(bricks_in_row):
			var brick = brick_scene.instantiate()
			add_child(brick)

			brick.set_level(ROWS - i)

			var x = start_x + j * (brick_size.x + margin.x)
			var y = spawn_position_y + i * (brick_size.y + margin.y)

			brick.position = Vector2(x, y)

			brick.brick_destroyed.connect(on_brick_destroyed)

			brick_count += 1


func on_brick_destroyed():
	brick_count -= 1
	if brick_count == 0:
		ball.stop_ball()
