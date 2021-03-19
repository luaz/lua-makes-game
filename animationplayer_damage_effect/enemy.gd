extends KinematicBody2D



func _ready():
    pass # Replace with function body.
        

func play_damage_effect(name):
    $AnimationPlayer.play(name)
