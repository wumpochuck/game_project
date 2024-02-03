extends Node2D

@export var hp = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(hp <= 0):
		free()


func _on_hurtbox_area_entered(hitbox):
	var damage = hitbox.damage
	hp -= damage
	print("Урон: " + str(damage) + ", Здоровье: " + str(hp))
