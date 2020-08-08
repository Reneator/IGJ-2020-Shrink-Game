extends Control

"""
Idea: I could drive up the price (like: I can produce wares and sell them to the people at increased rates?)
Or i can just go fromi a high stock and trying to shrink it.

Maybe have side-effects from having many shrinking-devices in circulations?


'You invested all your life-savings on your invention as you believe in it with all your being and ordered 1000 pieces of them. But due
to a computer-error the company produced 7.800.000.000 units. Now you have to get rid of them, or you will get completely broke due to the
storage costs. Quick Quick! Time is running out!'

You can spend money to advertise, to get more customers but at the same time you have to give money to the guy running the storage
so he doesnt just torch the place.

Improve Advertisement (Increases Number of customers/customer)
Improve Sales (better counter, more people selling stuff)

Maybe units even cost money when they arrive and you have to balance them arriving and the number of ones that you sell.
This would be close to paperclip logic, where you sometimes would have to change certain sliders to get things going properly

"""


"""
Number of customers defines the sell-rate

"""

"""
TODO: Create main gameplay loop
Get upgrades working
upgrade_buttons disable when not enough moneyy
Upgrades display via tooltip

"""

var active = false #if the loop is running or not, so the game can be paused

var interested_customers = 0 #the customers that would want to buy a unit
var interested_customers_rate = 1 #increase of interested customers per second base-rate


var units_arriving_per_second = 10 #The units that get delivered from the stock

var units_remaining_globally = 7800000000 #The big global storage that has to be all delivered or else the player fails
onready var units_remaining_globally_start_value = units_remaining_globally #buffer-value for progress %

var units_in_storage = 100 #the current available storage from which units will get sold

var money = 0 #the money you have available to buy upgrades

var start_price_per_unit = 10 #Price per unit that people are willing to pay (dont know if i want this to be changeable, else it would be too close to paperclip)


var sell_tick_rate = 1
var current_sell_tick = 0

var delivery_tick_rate = 1
var current_delivery_tick = 0

func _ready():
	$AcceptDialog.popup()

func _process(delta):
	if not active:
		return
	sell_unit_tick(delta)
	deliver_units_tick(delta)
	attract_customers_tick(delta)
	
#	refresh_ui()
	
func refresh_ui():
	$Displays/HBoxContainer/Unit_Count_Label.text = "%d" % units_in_storage
	$Displays/HBoxContainer2/Units_Remaining_To_Be_Shipped.text = "%d" % units_remaining_globally
	$Progress_Bar/TextureProgress.value = floor(units_remaining_globally)
	$Progress_Bar/TextureProgress.max_value = floor(units_remaining_globally_start_value)
	var percent_value = (units_remaining_globally_start_value / units_remaining_globally)   * 100.0
	$Progress_Bar/Progress_Label.text = "%d%%" % percent_value
	$Money_Label.text = "%d $" % money
	
	$Storage_Cost_Bar
	
	var max_storage = get_max_storage()
	var storage_percent = units_in_storage/ max_storage 
	var storage_percent_display = storage_percent * 100.0
	

func deliver_units_tick(delta):
	current_delivery_tick += delta
#	if current_delivery_tick >= delivery_tick_rate:
	deliver_units(delta)
#		current_delivery_tick = 0

func sell_unit_tick(delta):
	current_sell_tick += delta
	if current_sell_tick >= sell_tick_rate:
		sell_units()
		current_sell_tick = 0

func attract_customers_tick(delta):
	interested_customers += get_interested_customers_rate() * delta

func sell_units():
	if units_in_storage <= 0:
		return
	units_in_storage -= 1
	money += start_price_per_unit

func deliver_units(delta):
	if units_remaining_globally <= 0:
		win()
	var deliver_rate = get_deliver_rate()
	units_in_storage += deliver_rate * delta
	units_remaining_globally -= deliver_rate * delta

func get_deliver_rate():
	return 10

func get_interested_customers_rate():
	return interested_customers_rate

func get_sell_rate(): #depends on interested customers
	var sales_efficiency = get_sales_efficiency()
	return interested_customers * sales_efficiency

func get_sales_efficiency():
	return 0.2

func get_max_storage():
	return 100
	
func win():
	print("You win!")
	pass
	
func _on_Sell_Unit_Button_pressed():
	sell_units()
	pass # Replace with function body.


func _on_AcceptDialog_confirmed():
	active = true
