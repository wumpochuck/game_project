extends Node2D

var x_speed = 4.0
var y_speed = 2.0
var angle = 90 - rad_to_deg(atan(y_speed/x_speed))
var x_limit = 640
var bulletimage

# Called when the node enters the scene tree for the first time.
func _ready():
	bulletimage = $image
	bulletimage.rotation = -angle
	moving_out()
	print(angle)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func moving_out(): # Выстрел и полёт до центра мапки
	while(bulletimage.global_position.x + 32 <= 640):
		bulletimage.position = Vector2(bulletimage.position.x + x_speed, bulletimage.position.y - y_speed)
		await get_tree().create_timer(0.01).timeout
	
	bulletimage.z_index = -2
	while(bulletimage.global_position.x <= 670):
		bulletimage.position = Vector2(bulletimage.position.x + x_speed, bulletimage.position.y - y_speed)
		await get_tree().create_timer(0.01).timeout
		
	await get_tree().create_timer(1.5).timeout
	bulletimage.rotation = angle
	bulletimage.global_position.x = 610
	moving_in()
	
func moving_in(): # Полёт и врезание в объект
	
	while(bulletimage.global_position.x <= 640):
		bulletimage.position = Vector2(bulletimage.position.x + x_speed, bulletimage.position.y + y_speed)
		
	bulletimage.z_index = 0
	
	while(bulletimage.position.x <= 1280):
		bulletimage.position = Vector2(bulletimage.position.x + x_speed, bulletimage.position.y + y_speed)
		await get_tree().create_timer(0.01).timeout
		
	queue_free()








