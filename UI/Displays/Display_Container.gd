extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Delivery_Upgrade_Button_pressed():
	Global_2.upgrade_delivery()


func _on_Storage_Upgrade_Button_pressed():
	Global_2.upgrade_storage()

func _on_Advertisment_Upgrade_Button_pressed():
	Global_2.upgrade_customer_rate()
	
func _on_Shop_Upgrade_Button_pressed():
	Global_2.upgrade_shop()

func _on_Sales_Tactics_Upgrade_Button_pressed():
	Global_2.upgrade_sales_efficiency()
