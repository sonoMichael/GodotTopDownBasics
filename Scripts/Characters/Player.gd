extends CharacterBody2D


const Speed = 75.0
@onready var animationTree = $AnimationTree


func movementInput():
	var inputDirection = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = inputDirection * Speed
	animationTree.set("parameters/Idle/blend_position", inputDirection)
	#var stateMachine = animationTree.get("parameters/playback")
	#if (inputDirection != Vector2.ZERO):
		#pass
	#else:
		#stateMachine.travel("Idle")

func _physics_process(delta):
	movementInput()
	move_and_slide()
