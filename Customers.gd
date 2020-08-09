extends Control


export (NodePath) var customer_1
export (NodePath) var customer_2
export (NodePath) var customer_3
export (NodePath) var customer_4
export (NodePath) var customer_5
export (NodePath) var customer_6
export (NodePath) var customer_7
export (NodePath) var customer_8

onready var cust_1 = get_node(customer_1)
onready var cust_2 = get_node(customer_2)
onready var cust_3 = get_node(customer_3)
onready var cust_4 = get_node(customer_4)
onready var cust_5 = get_node(customer_5)
onready var cust_6 = get_node(customer_6)
onready var cust_7 = get_node(customer_7)
onready var cust_8 = get_node(customer_8)

export (int) var threshold_1
export (int) var threshold_2
export (int) var threshold_3
export (int) var threshold_4
export (int) var threshold_5
export (int) var threshold_6
export (int) var threshold_7
export (int) var threshold_8

func _process(delta):
	refresh_customers()

func refresh_customers():
	var customer_count = Global_2.current_customers
	if not cust_1:
		return
	cust_1.visible = customer_count >= threshold_1
	cust_2.visible = customer_count >= threshold_2
	cust_3.visible = customer_count >= threshold_3
	cust_4.visible = customer_count >= threshold_4
	cust_5.visible = customer_count >= threshold_5
	cust_6.visible = customer_count >= threshold_6
	cust_7.visible = customer_count >= threshold_7
	cust_8.visible = customer_count >= threshold_8
	
