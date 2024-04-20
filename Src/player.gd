extends CharacterBody2D

#class_name Character extends CharacterBody2D

@onready var anim = get_node("AnimatedSprite2D")


# Base player stats
var health = null
const speed = 75.0
var dmg = null


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")
	pass # Replace with function body.
	

func PlayerMovement():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
	match input_direction:
		Vector2(1, 0):  # move_right
			get_node("AnimatedSprite2D").flip_h = false
			anim.play("right")

		Vector2(-1, 0):  # move_left
			get_node("AnimatedSprite2D").flip_h = true
			anim.play("right")

		Vector2(0, 1):  # move_up
			anim.play("down")

		Vector2(0, -1):  # move_down
			anim.play("up")

		Vector2():  # standing still
			anim.play("idle")

func _process(delta):
	PlayerMovement()
	move_and_slide()
	pass
