extends KinematicBody2D


const GRAVITY = 600
const WALK_SPEED = 200
const JUMP_FORCE = 500

var velocity = Vector2()
var screen_size

onready var Projectile = preload("res://projectile.tscn")
onready var ProjectileArc = preload("res://projectile_arc.tscn")
onready var world = get_node("/root/World")
onready var enemy = get_node("/root/World/Enemy")

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
#    elif Input.is_action_pressed("attack"):
#        $Weapon.play_attack_animation()
     
    velocity = move_and_slide(velocity, Vector2.UP)
    
    # prevent player going out of screen
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)

func _input(event):
    if event.is_action_pressed("attack"):
        attack()
        # attack_arc()targetting
        
func attack():
    var projectile = Projectile.instance()
    world.add_child(projectile)
    projectile.position = position
    
    if enemy:
        var direction = (enemy.position - position).normalized()
        # fire vertically at enemy'd direction without targetting
        direction.y = 0
        projectile.launch(direction)
        
func attack_arc():
    var projectile = ProjectileArc.instance()
    world.add_child(projectile)
    projectile.position = position
    
    if enemy:
        projectile.launch(enemy.position)

func die():
    queue_free()   
