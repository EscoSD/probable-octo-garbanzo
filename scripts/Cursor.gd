extends CharacterBody2D

const SPEED = 300.0
const fruta = preload("res://scenes/Fruta0.tscn")

func _physics_process(_delta):
	var mouse_x = get_global_mouse_position().x
	mouse_x -= position.x
	
	move(mouse_x)
	if Input.is_action_just_pressed("LeftClick"):
		summon_fruit()


func move(mouse_x):
	velocity.x = move_toward(velocity.x, mouse_x, SPEED)
	move_and_collide(velocity)


func summon_fruit():
	var instance = fruta.instantiate()
	get_parent().add_child(instance)
	instance.position = position
