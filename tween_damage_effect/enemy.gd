extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tween = $Tween

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func play_damage_effect_tween(name):
    if name == "blink":
        tween.interpolate_property($Sprite, "modulate:a", 1, 0, 0.3)
        tween.start()
        yield(tween, "tween_completed")
        tween.interpolate_property($Sprite, "modulate:a", 0, 1, 0.1)
        tween.start()
    elif name == "knockback":
        tween.interpolate_property($Sprite, "offset:x", 0, 10, 0.3)
        tween.start()
        yield(tween, "tween_completed")
        tween.interpolate_property($Sprite, "offset:x", 10, 0, 0.1)
        tween.start()
        
func play_damage_effect(name):
     $AnimationPlayer.play(name)
