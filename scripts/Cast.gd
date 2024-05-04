extends RayCast2D

var density = 100
var _Particle = preload("res://Scenes/EchoParticle.tscn")
@onready var W = $"../.."

func _process(delta):
	transform.rotated(deg_to_rad(360 / density))

	for i in range(0, 360, 360 / density):
		print(i)
		rotation_degrees = i
		if is_colliding():
			#print(rotation_degrees)
			var collisionRotation = rotation_degrees
			var P = _Particle.instantiate()
			W.add_child(P)
			P.global_position = get_collision_point()

			# Draw a line from the ray origin to the collision point
			var ray_origin = global_position
			var collision_point = get_collision_point()
			#draw_line(ray_origin, collision_point, Color(1, 0, 0), 2)  # Red line

			# Additional logic based on collision rotation (if needed)
