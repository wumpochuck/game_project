extends Node2D


# Timer - await get_tree().create_timer(1.0).timeout
#var bullet_speed_x = 3
#var bullet_speed_y = 1
#var limit_x = 640
var bullet_scene : PackedScene = preload("res://Scenes/Bullet1/bullet_1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

'''
func shooting():
	# Проверки
	while(1):
		await  get_tree().create_timer(3.0).timeout
		add_child(bullet_scene.instantiate())
'''

func shooting():
	var target = get_local_mouse_position()
	
	var bullet = bullet_scene.instantiate()
	bullet.x_speed = target.x 
	bullet.y_speed = target.y - 1080/2
	
	print(target, position)
	add_child(bullet)
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		shooting()
