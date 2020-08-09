extends Control

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

func refresh_storages():
	if not storage_1:
		return
	var number_of_storages = Global_2.get_number_of_storages()
	var fill_percentage = Global_2.get_storage_fill_percent()
	for child in get_children():
		child.percent_full = fill_percentage
	

	storage_1.visible = number_of_storages >= threshold_1
	storage_2.visible = number_of_storages >= threshold_2
	storage_3.visible = number_of_storages >= threshold_3
	storage_4.visible = number_of_storages >= threshold_4

