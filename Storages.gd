extends Control


export (int) var current_number = 0 setget set_current_number

export (NodePath) var storage_1_path
export (NodePath) var storage_2_path
export (NodePath) var storage_3_path
export (NodePath) var storage_4_path

onready var storage_1 = get_node(storage_1_path)
onready var storage_2 = get_node(storage_2_path)
onready var storage_3 = get_node(storage_3_path)
onready var storage_4 = get_node(storage_4_path)

export (int) var threshold_1
export (int) var threshold_2
export (int) var threshold_3
export (int) var threshold_4

func _process(delta):
	refresh_storages()

func set_current_number(number):
	current_number = number
	refresh_storages()

func refresh_storages():
	var number_of_storages = Global_2.get_number_of_storages()
	current_number = number_of_storages
	var fill_percentage = Global_2.get_storage_fill_percent()
	for child in get_children():
		child.percent_full = fill_percentage
	
	if not storage_1:
		storage_1 = get_node(storage_1_path)
	if storage_1:
		storage_1.visible = current_number >= threshold_1
	
	if not storage_2:
		storage_2 = get_node(storage_2_path)
	if storage_2:
		storage_2.visible = current_number >= threshold_2
	
	if not storage_3:
		storage_3 = get_node(storage_3_path)
	if storage_3:
		storage_3.visible = current_number >= threshold_3
	
	if not storage_4:
		storage_4 = get_node(storage_4_path)
	if storage_4:
		storage_4.visible = current_number >= threshold_4

