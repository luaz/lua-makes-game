extends Area2D


const MOVE_SPEED = 200
const DAMAGE = 2

var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _physics_process(delta):
    position += velocity * MOVE_SPEED * delta
    
func launch(direction):
    velocity = direction
    
func _on_Projectile_body_entered(body):
    if body.is_in_group("enemy"):
        body.take_damage(DAMAGE)
        
    queue_free()

