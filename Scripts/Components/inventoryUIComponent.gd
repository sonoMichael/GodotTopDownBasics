extends Control

class_name InventoryUIComponent

@export var inputKey : String

var isOpen : bool = false

func _ready():
	closeInventory()

func _input(event):
	if event.is_action_pressed(inputKey):
		if isOpen:
			closeInventory()
		else:
			openInventory()

func openInventory():
	visible = true
	isOpen = true

func closeInventory():
	visible = false
	isOpen = false
