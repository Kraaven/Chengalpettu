extends Area2D

@export var TAG = "Enemy"
@onready var topArea = $HeadTop
@onready var bodyArea = $"."
@onready var rayCastRight = $RayCast2D
@onready var rayCastLeft = $RayCast2D2

var direction = 1
var speed = 40

func exportTag() -> String:
	return TAG

func _on_body_entered(body):
	if body.name == "Player":
		print("You died")
		get_tree().reload_current_scene()

func _process(delta):
	# Check for obstacles before moving
	if (!rayCastLeft.is_colliding() && get_node("%Player").position.x - position.x < 0):
		position.x -= speed * delta
	elif (!rayCastRight.is_colliding() && get_node("%Player").position.x - position.x > 0):
		position.x += speed * delta

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print("Head top hit")
		body.JUMP()
		queue_free()
