extends Area2D


const MOVE_SPEED = 600
const STEER_FORCE = 1800
const ARC_HEIGHT = 100
const DAMAGE = 2

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null
var mid_position = null

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func seek():
    var steer = Vector2.UP
    if mid_position:
        var desired = (mid_position - position).normalized() * MOVE_SPEED
        steer = (desired - velocity).normalized() * STEER_FORCE
    elif target:
        var desired = (target.position - position).normalized() * MOVE_SPEED
        steer = (desired - velocity).normalized() * STEER_FORCE
    return steer

func _physics_process(delta):
    acceleration = seek()
    velocity += acceleration * delta
    velocity = velocity.clamped(MOVE_SPEED)
    rotation = velocity.angle()
    position += velocity * delta
    if mid_position and position.distance_to(mid_position) < 5:
        mid_position = null
    
func launch(target):
    self.target = target
    if target:
        mid_position = (position + target.position) / 2
        mid_position.y -= ARC_HEIGHT


func _on_ProjectileHoming_body_entered(body):
    if body.is_in_group("enemy"):
        body.take_damage(DAMAGE)
        
    queue_free()
