extends Control


export (int) var store_fronts_count = 0 setget set_store_fronts_count

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

func _ready():
	refresh_store_fronts()


func set_store_fronts_count(count):
	store_fronts_count = count
	refresh_store_fronts()

func refresh_store_fronts():
	if not store_1:
		store_1 = get_node(store_front_1)
	if store_1:
		store_1.visible = store_fronts_count >= threshold_1
	
	if not store_2:
		store_2 = get_node(store_front_2)
	if store_2:
		store_2.visible = store_fronts_count >= threshold_2
	
	if not store_3:
		store_3 = get_node(store_front_3)
	if store_3:
		store_3.visible = store_fronts_count >= threshold_3
	
	if not store_4:
		store_4 = get_node(store_front_4)
	if store_4:
		store_4.visible = store_fronts_count >= threshold_4
	
	if not store_5:
		store_5 = get_node(store_front_5)
	if store_5:
		store_5.visible = store_fronts_count >= threshold_5
	
	if not store_6:
		store_6 = get_node(store_front_6)
	if store_6:
		store_6.visible = store_fronts_count >= threshold_6
		
	if not store_7:
		store_7 = get_node(store_front_7)
	if store_7:
		store_7.visible = store_fronts_count >= threshold_7
	
