extends Button

var hidden = false

func _on_Toggle_Button_pressed():
	if hidden:
		hidden = false
		$PanelContainer.show()
		text = "Hide"
	else:
		hidden = true
		$PanelContainer.hide()
		text = "Show"
