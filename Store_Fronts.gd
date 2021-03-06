extends Control


export (NodePath) var store_front_1
export (NodePath) var store_front_2
export (NodePath) var store_front_3
export (NodePath) var store_front_4
export (NodePath) var store_front_5
export (NodePath) var store_front_6
export (NodePath) var store_front_7

onready var store_1 = get_node(store_front_1)
onready var store_2 = get_node(store_front_2)
onready var store_3 = get_node(store_front_3)
onready var store_4 = get_node(store_front_4)
onready var store_5 = get_node(store_front_5)
onready var store_6 = get_node(store_front_6)
onready var store_7 = get_node(store_front_7)

export (int) var threshold_1
export (int) var threshold_2
export (int) var threshold_3
export (int) var threshold_4
export (int) var threshold_5
export (int) var threshold_6
export (int) var threshold_7

func _process(delta):
	refresh_store_fronts()

func refresh_store_fronts():
	var store_fronts_count = Global_2.shop_upgrade_level
	if not store_1:
		return
	store_1.visible = store_fronts_count >= threshold_1
	store_2.visible = store_fronts_count >= threshold_2
	store_3.visible = store_fronts_count >= threshold_3
	store_4.visible = store_fronts_count >= threshold_4
	store_5.visible = store_fronts_count >= threshold_5
	store_6.visible = store_fronts_count >= threshold_6
	store_7.visible = store_fronts_count >= threshold_7
