extends RayCast2D

var EcoP = preload("res://Scenes/EchoParticle.tscn")
var P
var D = 0.0
var X
var Yoffset = 0.0
var show = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Yoffset = target_position.y
	P = EcoP.instantiate()
	add_child(P)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_colliding()):
		X = get_collision_point()
		P.visible = true
		P.global_position = X
		
		D = global_position.distance_to(X)
		var C = Color(D/Yoffset,D/Yoffset,D/Yoffset,1.0)
		if(show):
			print(position)
		P.modulate = C
	else:
		P.visible = false
