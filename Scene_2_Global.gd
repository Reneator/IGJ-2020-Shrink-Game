extends Node

"""
TODO:
- Proper rates-upgrade-scalings!
- proper incremental scalings
"""

signal win()

var active = false #if the loop is running or not, so the game can be paused

var money = 0 #the money you have available to buy upgrades
var start_price_per_unit = 10 #Price per unit that people are willing to pay (dont know if i want this to be changeable, else it would be too close to paperclip)

func _process(delta):
	if not active:
		return
	if units_remaining_globally <= 0:
		win()
	sell_unit_tick(delta)
	deliver_units_tick(delta)
	attract_customers_tick(delta)

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
	return 10 * pow(1.5, delivery_upgrade_level)

func get_max_storage():
	var storage = 100 * storage_upgrade_level
	if storage_upgrade_level > 10:
		storage += (storage_upgrade_level - 10) * 10000
	if storage_upgrade_level > 20:
		storage += (storage_upgrade_level -20) * 100000
	if storage_upgrade_level > 30:
		storage += (storage_upgrade_level -30) * 1000000
	if storage_upgrade_level > 40:
		storage += (storage_upgrade_level -40) * 10000000
	if storage_upgrade_level > 50:
		storage += (storage_upgrade_level -50) * 100000000
	
	return storage

func get_number_of_storages():
	return storage_upgrade_level

func get_storage_fill_percent():
	var max_storage = get_max_storage()
	var current_units = units_in_storage
	return float(current_units)/float(max_storage)

func upgrade_storage():
	var cost = get_storage_upgrade_cost()
	if not can_pay(cost):
		return
	pay(cost)
	storage_upgrade_level += 1

func upgrade_delivery():
	var cost = get_delivery_upgrade_cost()
	if not can_pay(cost):
		return
	pay(cost)
	delivery_upgrade_level += 1

func get_delivery_upgrade_cost():
	return get_deliver_rate() * pow(1.01, delivery_upgrade_level)

func get_delivery_upgrade_tooltip():
	var cost = get_delivery_upgrade_cost()
	return """Invest into better Logistics to deliver more Boxes!
	Current Level: %d
	Cost: %d $""" % [delivery_upgrade_level, cost]

func get_storage_upgrade_cost():
	return get_max_storage()

func get_storage_upgrade_tooltip():
	var cost = get_storage_upgrade_cost()
	return """Buy more storage space to fit all those boxes!
	Current Level: %d
	Cost: %d $""" % [storage_upgrade_level, cost]

#END-STORAGE


#CUSTOMERS
var current_customers = 0 #the customers that would want to buy a unit
var new_customers_rate = 1 #increase of interested customers per second base-rate
var customer_rate_upgrade_level = 1

func attract_customers_tick(delta):
	current_customers += get_new_customers_rate() * delta

func get_new_customers_rate():
	return exp(customer_rate_upgrade_level)

func get_current_customers():
	return current_customers

func upgrade_customer_rate():
	var cost = get_customer_rate_upgrade_cost()
	if not can_pay(cost):
		return
	pay(cost)
	customer_rate_upgrade_level += 1

func get_customer_rate_upgrade_cost():
	return 100 * pow(2.5,customer_rate_upgrade_level)

func get_customer_rate_upgrade_tooltip():
	var cost = get_customer_rate_upgrade_cost()
	return """Invest more money into advertisment
	to win more potential customers!
	Current Level: %d
	Cost: %d $
	""" % [customer_rate_upgrade_level, cost]
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
	
	var raw_sales
	if sell_rate < 1:
		raw_sales = 1
	else:
		raw_sales = round(sell_rate)

	var sales
	if units_in_storage < raw_sales:
		sales = units_in_storage
	else:
		sales = raw_sales
	
	var price = get_price()
	
	units_in_storage -= sales
	var customer_losses = get_customer_loss()
	current_customers -= customer_losses
	money += price * sales

func get_sales_rate(): #depends on interested customers
	var sales_efficiency = get_sales_efficiency()
	return current_customers * sales_efficiency

func get_customer_loss():
	var sales_efficiency = get_sales_efficiency()
	if sales_efficiency < 1:
		return current_customers * sales_efficiency
	if sales_efficiency > 1:
		return current_customers


func get_sales_efficiency():
	return 0.1 * pow(1.7,sales_efficiency_upgrade_level)

func get_price():
	return pow(1.2,shop_upgrade_level - 1) * 10

func upgrade_shop():
	var cost = get_upgrade_shop_cost()
	if not can_pay(cost):
		return
	pay(cost)
	shop_upgrade_level+=1

func get_upgrade_shop_cost():
	return 100/shop_upgrade_level * pow(shop_upgrade_level,shop_upgrade_level)

func get_sales_efficiency_cost():
	return 100 * pow(sales_efficiency_upgrade_level, sales_efficiency_upgrade_level)

func upgrade_sales_efficiency():
	var cost = get_sales_efficiency_cost()
	if not can_pay(cost):
		return
	pay(cost)
	sales_efficiency_upgrade_level+=1

func get_sales_efficiency_upgrade_tooltip():
	var cost = get_sales_efficiency_cost()
	return """Improve your sales-department so 
	they can make a higher percentage of your customers
	buy your product!
	Maybe even get them to buy more than one!
	Current Level: %d
	Cost: %d $""" % [sales_efficiency_upgrade_level, cost]

func get_shop_upgrade_tooltip():
	var cost  = get_upgrade_shop_cost()
	var price = get_price()
#	return "blubb"
	return """Upgrade your Shops and you can take more money
	per product!
	Current Level: %d
	Cost: %d $
	Current Price: %d $
	""" % [shop_upgrade_level, cost, price]

#END-SALES

func can_pay(cost):
	return money >= cost

func pay(cost):
	if not can_pay(cost):
		return
	money -= cost

func win():
	active = false
	units_remaining_globally = 0
	emit_signal("win")
	print("You win!")
