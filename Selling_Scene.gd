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

var units_arriving_per_second = 10

var units_remaining_globally = 7800000000

var units_in_storage = 100

var money = 0

var start_price_per_unit = 10


var sell_tick_rate = 1
var current_tick = 0


func _process(delta):
	current_tick += delta
	if current_tick >= sell_tick_rate:
		sell_unit()
		current_tick = 0
	
	
	refresh_ui()

func refresh_ui():
	$VBoxContainer/HBoxContainer/Unit_Count_Label.text = str(units_in_storage)
	$VBoxContainer/HBoxContainer2/Units_Remaining_To_Be_Shipped.text = str(units_remaining_globally)
	
	

func sell_unit():
	if units_in_storage <= 0:
		return
	units_in_storage -= 1
	money += start_price_per_unit
	


func _on_Sell_Unit_Button_pressed():
	sell_unit()
	pass # Replace with function body.
