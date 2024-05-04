#extends Node2D
#
## Define properties
#var density = 10
#var maxDistance = 200
#
## Reference to the RayCast2D node
#var raycast
#
#func _ready():
	## Get reference to the RayCast2D node
	#raycast = $"../RayCast2D"
#
#func _process(delta):
	#for i in range(0, 360, 360 / density):
		## Update RayCast2D rotation and cast_to direction
		#raycast.rotation_degrees = i
		#raycast.cast_to = Vector2(maxDistance, 0).rotated(deg_to_rad(i))
#
		## Check for collision
		#if raycast.is_colliding():
			## Get collision point
			#var collision_point = raycast.get_collision_point()
			## Spawn particle at collision point
			#spawn_particle(collision_point)
#
#func spawn_particle(position):
	## Load particle scene
	#var particle = preload("res://Scenes/EchoParticle.tscn").instance()
	## Set particle position
	#particle.position = position
	## Calculate distance to adjust particle color
	#var distance = position.distance_to(global_position)
	#var shade = (maxDistance - distance) / maxDistance
	## Set particle color
	#particle.color = Color(shade, shade, shade)
	## Add particle to the scene
	#add_child(particle)
