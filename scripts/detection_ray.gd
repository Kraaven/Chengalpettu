extends RayCast2D

var EcoP = preload("res://Scenes/EchoParticle.tscn")
var P
var D = 0.0
var X
var Yoffset = 0.0
var C
# Called when the node enters the scene tree for the first time.
func _ready():
	Yoffset = target_position.y
	P = EcoP.instantiate()
	P.scale *= 0.5
	add_child(P)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(is_colliding()):
		X = get_collision_point()
		P.visible = true
		P.global_position = X
		D = map_and_invert(global_position.distance_to(X))
		if(get_collider().name != "Player"):
			C = SetColorOnTarget(get_collider().exportTag(), D)

			P.modulate = C
			var Ran = randf_range(0.275,0.95)
			P.scale = Vector2(Ran,Ran)
			P.rotation_degrees = randi()
	else:
		P.visible = false

func map_and_invert(value: float) -> float:
	# Map the value from the range 0-400 to the range 0-1
	var mapped_value = value / 400.0
	
	# Invert the mapped value
	#var inverted_value = 1.0 - mapped_value
	
	return mapped_value

func darken_color(color: Color, factor: float) -> Color:
	# Clamp the factor between 0 and 1
	factor = clamp(factor, 0, 1)
	
	# Reduce the intensity of each color component
	var new_color = Color(color.r * (1 - factor), color.g * (1 - factor), color.b * (1 - factor), color.a)
	
	return new_color

func SetColorOnTarget(target: String, dist: float) -> Color:
	match target:
		"Box":
			return darken_color(Color.SADDLE_BROWN, dist)
		"Special":
			return darken_color(Color.YELLOW, dist*1.5)
		_:
			return darken_color(Color(1, 1, 1), dist*2)
