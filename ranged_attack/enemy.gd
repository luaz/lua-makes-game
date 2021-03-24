extends KinematicBody2D


const WALK_SPEED = 100
const GRAVITY = 600

var health = 5

onready var player = get_node("/root/World/Player")
onready var tween = $Tween

func _ready():
    pass # Replace with function body.

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
        
func _physics_process(delta):
    if player:
        var direction = (player.position - position).normalized()
        if not is_on_floor():
            direction.y += GRAVITY

        move_and_slide(direction * WALK_SPEED)

        for i in get_slide_count():
            var collision = get_slide_collision(i)
            # if collision.collider.name == "Player":
            var object = collision.collider
            if object.is_in_group("player"):
                object.die()

            
        
        

