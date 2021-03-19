extends KinematicBody2D


var health = 5

onready var tween = $Tween

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func play_damage_effect():
    tween.interpolate_property($Sprite, "offset:x", 0, 10, 0.3)
    tween.start()
    yield(tween, "tween_completed")
    tween.interpolate_property($Sprite, "offset:x", 10, 0, 0.1)
    tween.start()
    
func play_death_effect():
    tween.interpolate_property($Sprite, "modulate:a", 1, 0, 0.4)
    tween.start()    
    yield(tween, "tween_completed")
    queue_free()

func take_damage(damage):
    health -= damage
    if health > 0:
        play_damage_effect()
    else:
        play_death_effect()
        
    
    
    
