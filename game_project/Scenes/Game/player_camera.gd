extends Camera2D

''' Switch camera - "Z" '''

#var left_limit = -1280
#var right_limit = 2560
#var trigger_zone = 5
var camera_speed = 5
var flag = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta = 30.0):
	moving(flag)

	
func _input(event):
	if Input.is_action_pressed("switch_camera"):
		switch_camera(-flag)
		flag = -flag

func moving(flag):
	if flag == 1:
		var camera_x = get_local_mouse_position()[0]
		if (camera_x < -450): # and (global_camera_x >= left_limit):
			position.x -= camera_speed * 10
		elif (camera_x > 450): # and (global_camera_x <= right_limit):
			position.x += camera_speed * 10


func switch_camera(flag): #Писал чтобы не листать но чет хуйня получилась
	if flag == 1:
		position = Vector2(640,360)
		zoom = Vector2(1,1)
		#DisplayServer.window_set_size(Vector2(1280,720))
		pass
	else:
		position = Vector2(640,360)
		zoom = Vector2(0.334,0.334)
		#DisplayServer.window_set_size(Vector2(3840,720))
		pass

