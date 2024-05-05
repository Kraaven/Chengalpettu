extends Area2D


@export var TAG = "Enemy"
@onready var topArea = $HeadTop
@onready var bodyArea = $"."
@onready var rayCastRight = $RayCastRight
@onready var rayCastLeft = $RayCastLeft

var direction = 1
var speed = 10

func exportTag() -> String:
	return TAG

func _on_head_top_body_entered(body):
	print("Head top hit")
	queue_free() 


func _on_body_entered(body):
	print("You died")
	get_tree().reload_current_scene()
	
func _process(delta):
	if rayCastRight.is_colliding():
		direction = -1
	if rayCastLeft.is_colliding():
		direction = 1
	
	position.x += direction * speed * delta
	
