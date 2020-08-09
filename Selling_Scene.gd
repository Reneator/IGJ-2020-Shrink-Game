extends Control

func _ready():
	$AcceptDialog.popup()
	Global_2.connect("win", self, "on_win")

	
func _on_Sell_Unit_Button_pressed():
	Global_2.sell_units()
	pass # Replace with function body.


func _on_AcceptDialog_confirmed():
	Global_2.active = true


func _on_Win_Dialog_confirmed():
	pass # Replace with function body.

func on_win():
	$Win_Dialog.popup()
