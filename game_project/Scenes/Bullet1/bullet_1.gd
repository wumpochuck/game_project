extends RigidBody2D

var x_speed = 300
var y_speed = -1000

var gravity = 10 # Значение гравитации

func _ready():
	linear_velocity = Vector2(x_speed, y_speed) # Устанавливаем начальную скорость пули

func _integrate_forces(state):
	linear_velocity.y += gravity * state.get_step() # Применяем гравитацию к скорости по оси Y
