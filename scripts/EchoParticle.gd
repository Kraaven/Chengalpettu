extends Sprite2D

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = randi()
	
func initialize(distance):
	if(distance/20 > 4.5):
		timer.wait_time = 4.5
	else:
		timer.wait_time = distance/20
	
	print(timer.wait_time)
	timer.start()

func _on_timer_timeout():
	queue_free()
