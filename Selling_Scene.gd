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



func _ready():
	$AcceptDialog.popup()


	
#	refresh_ui()
	
#func refresh_ui():
#	units_in_storage_label.text = "%d" % units_in_storage
#	$Displays/HBoxContainer2/Units_Remaining_To_Be_Shipped.text = "%d" % units_remaining_globally
#
#
#	$Storage_Cost_Bar
#
#	var max_storage = get_max_storage()
#	var storage_percent = units_in_storage/ max_storage 
#	var storage_percent_display = storage_percent * 100.0
	
func _on_Sell_Unit_Button_pressed():
	Global_2.sell_units()
	pass # Replace with function body.


func _on_AcceptDialog_confirmed():
	Global_2.active = true
