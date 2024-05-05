extends StaticBody2D

var TAG = "Special"
@export var power: PowerUps
# Called when the node enters the scene tree for the first time.
func _ready():
	power = PowerUps.NONE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func exportTag() -> String:
	return TAG

enum PowerUps {
	NONE,
	Mushroom,
	Star,
	fire
}

func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		if(power == PowerUps.NONE):
			var B = preload("res://Scenes/block.tscn").instantiate()
			get_parent().add_child(B)
			B.global_position = global_position
			queue_free()
		elif (power == PowerUps.Mushroom):
			body.increase()
