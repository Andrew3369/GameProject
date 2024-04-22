extends CharacterBody2D

class Player extends CharacterBody2D:
	var private_health = null
	const SPEED = 75.0
	var dmg = null
	@onready var anim

	func PlayerMovement():
		var input_direction = Input.get_vector("move_right", "move_left", "move_down", "move_up")
		velocity = input_direction * SPEED

		match input_direction:
			Vector2(1, 0):  # move_right
				get_node("AnimatedSprite2D").flip_h = false
				anim.play("right")

			Vector2(-1, 0):  # x coor, move left
				get_node("AnimatedSprite2D").flip_h = true
				anim.play("right")

			Vector2(0, 1):  # y coor, move down
				anim.play("down")

			Vector2(0, -1):  # y coor, move up
				anim.play("up")

			Vector2(0, 0):  # idle, no input
				anim.play("idle")

# Experimenting OOP programming for Player class
#var player = Player.new()
#
#func _ready():
	#add_child(player)
	#player.anim = get_node("AnimatedSprite2D")
#
#
#func _process(delta):
	#player.PlayerMovement()
	#move_and_slide()
	

# Tis here until OOP starts working
@onready var anim = get_node("AnimatedSprite2D")
const SPEED = 75.0
func PlayerMovement():
		var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = input_direction * SPEED

		match input_direction:
			Vector2(1, 0):  # move_right
				get_node("AnimatedSprite2D").flip_h = false
				anim.play("right")

			Vector2(-1, 0):  # x coor, move left
				get_node("AnimatedSprite2D").flip_h = true
				anim.play("right")

			Vector2(0, 1):  # y coor, move down
				anim.play("down")

			Vector2(0, -1):  # y coor, move up
				anim.play("up")

			Vector2(0, 0):  # idle, no input
				anim.play("idle")

func _ready():
	anim.play("idle")

func _process(delta):
	PlayerMovement() # Movement
	move_and_slide()
