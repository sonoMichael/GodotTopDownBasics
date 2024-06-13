extends Control

var isOpen : bool = false

func _ready():
	closeInventory()

func _input(event):
	if event.is_action_pressed("E"):
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
