extends RigidBody2D

@export var x_speed = 0
@export var y_speed = 0





func _ready():
	linear_velocity = Vector2(x_speed, y_speed) # Устанавливаем начальную скорость пули
	$image.rotation = linear_velocity.angle() # Поворачиваем спрайт в соответствии с направлением скорости

func _integrate_forces(state):
	$image.rotation = linear_velocity.angle() # Обновляем поворот спрайта в соответствии с изменением скорости

