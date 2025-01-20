extends Area2D

signal exit

@onready var enter_collision: CollisionShape2D = $enter
@onready var exit_collision: CollisionShape2D = $exit


func enable_collision():
	enter_collision.set_deferred("disabled", false)
	exit_collision.set_deferred("disabled", false)


func _on_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player"):
		match local_shape_index:
			0: # enter
				body.change_floppy(true)
			1: # exit
				body.change_floppy(false)
				queue_free()
				exit.emit()
			_: # what?
				print("Unknown CollisionShape2D index "+str(local_shape_index)+" detected.")
