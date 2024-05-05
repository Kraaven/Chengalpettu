extends RayCast2D

var EcoP = preload("res://Scenes/EchoParticle.tscn")
@onready var timer = $Timer

var P
var D = 0.0
var X
var Yoffset = 0.0
var show = false
var world
# Called when the node enters the scene tree for the first time.
func _ready():
	Yoffset = target_position.y
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass


func _on_timer_timeout():
	if(is_colliding()):
		P = EcoP.instantiate()
		world.add_child(P)
		X = get_collision_point()
		P.global_position = X
		D = global_position.distance_to(X)
		var C = Color(D/Yoffset,D/Yoffset,D/Yoffset,1.0)
		P.modulate = C
		P.initialize(D)
	timer.start()
