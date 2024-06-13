extends CharacterBody2D


@onready var animationTree = $AnimationTree
@onready var tileMap : TileMap = $"../TileMap"
var groundLayer : int = 1

@export var Speed : float = 75.0
@export var Inventory : Inventory


func _physics_process(delta):
	movementInput()
	move_and_slide()


func movementInput():
	var inputDirection : Vector2 = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	velocity = inputDirection * Speed
	var stateMachine = animationTree["parameters/playback"]
	if inputDirection == Vector2.ZERO:
		stateMachine.travel("Idle")
	else:
		stateMachine.travel("Walk")
		animationTree.set("parameters/Idle/blend_position", inputDirection)
		animationTree.set("parameters/Walk/blend_position", inputDirection)

func _input(event):
	if event.is_action_pressed("Action"):
		var playerPosition = tileMap.local_to_map(position)
		var environmentLayer : int = 4
		var plantSourceID : int = 2
		var wheatPlantCoords : Vector2i = Vector2i(1, 0)
		var ground2Layer : int = 2
		var tileData = tileMap.get_cell_tile_data(ground2Layer, playerPosition)
		var canPlaceSeedsCustomData = "canPlaceSeeds"
		
		if tileData:
			var canPlaceSeeds = tileData.get_custom_data(canPlaceSeedsCustomData)
			if canPlaceSeeds:
				tileMap.set_cell(environmentLayer, playerPosition, plantSourceID, wheatPlantCoords)
				print("Placing seed!")
			else:
				print("Can't place seeds here!")
		else:
			print("No custom data detected")
