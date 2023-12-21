class_name Fruta
extends RigidBody2D

enum Sizes {
	A, B, C, D, E
}

const fruta = preload("res://scenes/Fruta0.tscn")

var size: Sizes


# Called when the node enters the scene tree for the first time.
func _ready():
	construct(Sizes.A)
 

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func construct(new_size: Sizes):
	match size:
		Sizes.A:
			self.modulate = Color(0.141, 0.565, 0.878)
		Sizes.B:
			self.modulate = Color(0.216, 0.631, 0.02)
		Sizes.C:
			self.modulate = Color(0.729, 0, 0.004)
		Sizes.D:
			self.modulate = Color(0.988, 0.812, 0.333)
		Sizes.E:
			self.modulate = Color(0, 0, 0)


func create_ball():
	var instance = fruta.instantiate()
	instance.construct(self.size + 1)
	get_parent().call_deferred("add_child", instance)
	instance.position = position


func _on_ball_detector_body_entered(body):
	if not body is Fruta or body == self or self.size != body.size:
		return
	
	if size < Sizes.E:
		create_ball()
		
	body.queue_free()
	queue_free()
