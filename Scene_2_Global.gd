extends Node

var active = false #if the loop is running or not, so the game can be paused

var money = 0 #the money you have available to buy upgrades
var start_price_per_unit = 10 #Price per unit that people are willing to pay (dont know if i want this to be changeable, else it would be too close to paperclip)

func _process(delta):
	if not active:
		return
	sell_unit_tick(delta)
	deliver_units_tick(delta)
	attract_customers_tick(delta)
	cost_tick(delta)

#STORAGE

var units_remaining_globally = 7800000000 #The big global storage that has to be all delivered or else the player fails
onready var units_remaining_globally_start_value = units_remaining_globally #buffer-value for progress %

var units_in_storage = 100 #the current available storage from which units will get sold

var units_arriving_per_second = 10 #The units that get delivered from the global stock

var delivery_tick_rate = 2
var current_delivery_tick = 0

var storage_upgrade_level = 1
var delivery_upgrade_level = 1

func deliver_units_tick(delta):
	current_delivery_tick += delta
	if current_delivery_tick >= delivery_tick_rate:
		deliver_units()
		current_delivery_tick = 0

func deliver_units():
	if units_remaining_globally <= 0:
		win()
	var deliver_rate = get_deliver_rate()
	var max_storage = get_max_storage()
	var space_left = max_storage - units_in_storage
	var shipment 
	if space_left < deliver_rate:
		shipment = space_left
	else:
		shipment = deliver_rate
	units_in_storage += shipment
	units_remaining_globally -= shipment

func get_deliver_rate():
	return 10 * delivery_upgrade_level

func get_max_storage():
	return 100 * storage_upgrade_level

func get_number_of_storages():
	return storage_upgrade_level

func get_storage_fill_percent():
	var max_storage = get_max_storage()
	var current_units = units_in_storage
	return current_units/max_storage

func upgrade_storage():
	var cost = storage_upgrade_level * 100
	storage_upgrade_level += 1

func upgrade_delivery():
	delivery_upgrade_level += 1

#END-STORAGE


#CUSTOMERS
var current_customers = 0 #the customers that would want to buy a unit
var new_customers_rate = 1 #increase of interested customers per second base-rate
var customer_rate_upgrade_level = 1

func attract_customers_tick(delta):
	current_customers += get_new_customers_rate() * delta

func get_new_customers_rate():
	return new_customers_rate * customer_rate_upgrade_level

func get_current_customers():
	return current_customers

func upgrade_customer_rate():
	customer_rate_upgrade_level += 1
#END-CUSTOMERS


#SALES

var sell_tick_rate = 1
var current_sell_tick = 0
var shop_upgrade_level = 1
var sales_efficiency_upgrade_level = 1

func sell_unit_tick(delta):
	current_sell_tick += delta
	if current_sell_tick >= sell_tick_rate:
		sell_units()
		current_sell_tick = 0

var sales_buffer = 0

func sell_units():
	if units_in_storage <= 0:
		return
	var sell_rate = get_sales_rate()
	
	var raw_sales = ceil(sell_rate)
	var sales
	

		
	if units_in_storage < raw_sales:
		sales = units_in_storage
	else:
		sales = raw_sales
	
	if sales > current_customers:
		sales = current_customers

	
	units_in_storage -= sales
	current_customers -= sales
	money += start_price_per_unit * sales

func get_sales_rate(): #depends on interested customers
	var sales_efficiency = get_sales_efficiency()
	return current_customers * sales_efficiency * shop_upgrade_level

func get_sales_efficiency():
	return 0.1 * sales_efficiency_upgrade_level

func upgrade_shop():
	shop_upgrade_level+=1

func upgrade_sales_efficiency():
	sales_efficiency_upgrade_level+=1

#END-SALES


#COST
var cost_current_time = 0

func get_cost():
	return 50

func get_cost_interval():
	return 30


func cost_tick(delta):
	var cost_interval = get_cost_interval()
	cost_current_time += delta
	if cost_current_time >= cost_interval:
		pay_costs()
		cost_current_time = 0

func pay_costs():
	var cost = get_cost()
	print("you would pay %d$ now!" % cost)
	pay(cost)
	#here the player could loose if he cant pay

func can_pay(cost):
	return money >= cost

func pay(cost):
	money -= cost
#END-COST



func win():
	print("You win!")
	pass
