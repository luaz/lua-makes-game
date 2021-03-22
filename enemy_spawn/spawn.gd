extends Node2D


const ROTATION_SPEED = 2


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _process(delta):
    rotation += ROTATION_SPEED * delta
