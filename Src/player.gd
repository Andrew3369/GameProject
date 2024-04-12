extends CharacterBody2D

#class_name Character extends CharacterBody2D

@onready var anim = get_node("AnimatedSprite2D")

# Base player stats
var health = null
const speed = 75.0
var dmg = null

#func _init(arg):
	#health = 100
	#dmg = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")
	pass # Replace with function body.
	
#func betterMovement():
	#var directionX = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#var directionY = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	#
	#match directionX && direcitonY:
		#(1, 0):
			#move_right()
		#_:
			#if get_node("AnimatedSprite2D").animation != "attackX":
				#anim.play("idle")
			#velocity.x = move_toward(velocity.x, 0, speed)
			#velocity.y = move_toward(velocity.y, 0, speed)
		
		
func move_right():
	get_node("AnimatedSprite2D").flip_h = false
	anim.play("right")
	velocity.x = speed
	
func PlayerMovement():
	var directionX = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var directionY = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	#Determine which animation to play based on direction
	if directionX < 0:
		get_node("AnimatedSprite2D").flip_h = true
		anim.play("right")
		
	elif directionX > 0:
		get_node("AnimatedSprite2D").flip_h = false
		anim.play("right")

	elif directionY == -1: # Run up
		anim.play("up")

	elif directionY == 1:
		anim.play("down") # Run down

	if directionX != 0 or directionY != 0:
		velocity.x = directionX * speed
		velocity.y = directionY * speed

	else:
		if get_node("AnimatedSprite2D").animation != "attackX":
			anim.play("idle")
			
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerMovement()
	move_and_slide()
	pass
