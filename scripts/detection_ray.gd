extends RayCast2D

var EcoP = preload("res://Scenes/EchoParticle.tscn")
var P
# Called when the node enters the scene tree for the first time.
func _ready():
	P = EcoP.instantiate()
	add_child(P)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_colliding()):
		P.visible = true
		P.global_position = get_collision_point()
		print(rotation_degrees," has a hit")
	else:
		P.visible = false
		print(rotation_degrees, " has not hit")
