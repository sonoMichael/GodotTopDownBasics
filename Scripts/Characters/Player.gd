extends CharacterBody2D


const Speed = 75.0

@onready var animationTree = $AnimationTree


func movementInput():
	var inputDirection = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	velocity = inputDirection * Speed
	var stateMachine = animationTree["parameters/playback"]
	if (inputDirection == Vector2.ZERO):
		stateMachine.travel("Idle")
	else:
		stateMachine.travel("Walk")
		animationTree.set("parameters/Idle/blend_position", inputDirection)
		animationTree.set("parameters/Walk/blend_position", inputDirection)

func _physics_process(delta):
	movementInput()
	move_and_slide()
