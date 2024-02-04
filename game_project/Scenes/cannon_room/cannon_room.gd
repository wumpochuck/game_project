extends CharacterBody2D


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

func _physics_process(delta):
	if is_multiplayer_authority():
		velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 1000
		move_and_slide()
	
	
func _enter_tree():
	set_multiplayer_authority(name.to_int())
