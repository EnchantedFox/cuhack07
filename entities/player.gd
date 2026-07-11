extends Area2D

var tile_size = 32
var inputs = {
	KEY_UP: Vector2.UP,
	KEY_RIGHT: Vector2.RIGHT,
	KEY_DOWN: Vector2.DOWN,
	KEY_LEFT: Vector2.LEFT,
	KEY_W: Vector2.UP,
	KEY_D: Vector2.RIGHT,
	KEY_S: Vector2.DOWN,
	KEY_A: Vector2.LEFT
}

var ray

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
	ray = $RayCast2D
	print(ray)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		for dir in inputs.keys():
			if event.pressed and event.keycode == dir:
				move(dir);
				break;

func move(dir):
	position += inputs[dir] * tile_size;
	#ray.target_position = inputs[dir] * tilesize();
