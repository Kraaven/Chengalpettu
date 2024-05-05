extends Node2D

var density = 200
var RayPrefab = preload("res://Scenes/detection_ray.tscn")
var Rays = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, 360, 360 / density):
		var R = RayPrefab.instantiate()
		$".".add_child(R)
		R.rotation_degrees = i
		Rays.append(R)
		


# Called every frame. 'delta' is the elapsed time since the previous frame
