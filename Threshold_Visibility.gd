tool
extends Control

export (int) var threshold = 0 #the threshold over which the customer will be visible
var current_number = 0 setget set_current_number

func set_current_number(number):
	current_number = number
	var is_visible = current_number >= threshold
	visible = is_visible
