extends KinematicBody2D


const GRAVITY = 600
const WALK_SPEED = 200
const JUMP_FORCE = 500

var velocity = Vector2()
var screen_size


func _ready():
    screen_size = get_viewport_rect().size
    

func _physics_process(delta):
    velocity.y += delta * GRAVITY
    
    if Input.is_action_pressed("ui_left"):
        velocity.x = -WALK_SPEED
    elif Input.is_action_pressed("ui_right"):
        velocity.x = WALK_SPEED
    else:
        # velocity.x = 0
        # smoothen the stop
        velocity.x = lerp(velocity.x, 0, 0.1)
    
    if Input.is_action_pressed("ui_up") and is_on_floor():
        velocity.y = -JUMP_FORCE
    elif Input.is_action_pressed("attack"):
        $Weapon.play_attack_animation()
     
    velocity = move_and_slide(velocity, Vector2.UP)
    
    # prevent player going out of screen
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)

    
