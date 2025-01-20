extends Node2D

const ENEMY_SPEED = 40

var direction = 1

@onready var ray_cast_2d_right: RayCast2D = $"RayCast2D right"
@onready var ray_cast_2d_left: RayCast2D = $"RayCast2D left"

@onready var timer: Timer = $Timer
var timer_finished: bool = true

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta):
	if timer_finished == true:
		# timer has timed out
		if ray_cast_2d_right.is_colliding():
			direction = -1 # change direction
			animated_sprite.flip_h = true # flip sprite
			# start timer for freezing
			timer.start()
			timer_finished = false
		if ray_cast_2d_left.is_colliding():
			direction = 1 # change direction
			animated_sprite.flip_h = false # flip sprite
			# start timer for freezing
			timer.start()
			timer_finished = false
	
		position.x += direction * delta * ENEMY_SPEED


func _on_timer_timeout() -> void:
	timer_finished = true
