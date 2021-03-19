extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _input(event):
    if event.is_action_pressed("ui_up"):
        $Enemy.play_damage_effect("blink")
    elif event.is_action_pressed("ui_down"):
        $Enemy.play_damage_effect("knockback_and_blink")
