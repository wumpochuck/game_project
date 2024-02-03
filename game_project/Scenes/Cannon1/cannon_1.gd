extends Node2D


# Timer - await get_tree().create_timer(1.0).timeout

var target
var bullet_scene : PackedScene = preload("res://Scenes/Bullet1/bullet_1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	shooting()
	$scope.visible = false
	pass # Replace with function body.


func shooting():
	if target != null:
		#target = get_local_mouse_position()
		
		var bullet = bullet_scene.instantiate()
		bullet.get_node("Hitbox").damage = 10 # Ставлю урон выстрела
		bullet.x_speed = target.x 
		bullet.y_speed = target.y - 1080/2
	
		add_child(bullet)
	
func _input(event):
	if (event.is_action_pressed("ui_accept") and is_multiplayer_authority()):
		target = get_local_mouse_position()
		$scope.visible = true
		$scope.position = target
		#shooting()

func _on_reload_timeout():
	shooting()
	pass # Replace with function body.


func _enter_tree():
	set_multiplayer_authority(name.to_int())
