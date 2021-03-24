extends Node


var Enemy = preload("res://enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_SpawnTimer_timeout():
    var enemy = Enemy.instance()
    add_child(enemy)
    enemy.position = $Spawn.position
    
    # change spawn position
#    var area = $SpawnArea
#    var position = area.rect_position + Vector2(randf() * area.rect_size.x, randf() * area.rect_size.y)
#    $Spawn.position = position

#    var nodes = get_tree().get_nodes_in_group("spawn")
#    var node = nodes[randi() % nodes.size()]
#    var position = node.position
#    $Spawn.position = position
