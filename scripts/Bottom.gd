extends Area2D

func exportTag() -> String:
	return "Death"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	get_tree().change_scene_to_file("res://Scenes/NewGame.tscn")
