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

func _process(delta):
	var delivery_upgrade_tooltip = Global_2.get_delivery_upgrade_tooltip()
	var storage_upgrade_tooltip = Global_2.get_storage_upgrade_tooltip()
	var advertisment_upgrade_tooltip = Global_2.get_customer_rate_upgrade_tooltip()
	var shop_upgrade_tooltip = Global_2.get_shop_upgrade_tooltip()
	var sales_tactics_tooltip = Global_2.get_sales_efficiency_upgrade_tooltip()
	$HBoxContainer/VBoxContainer/Delivery_Upgrade_Button.hint_tooltip = delivery_upgrade_tooltip
	$HBoxContainer/VBoxContainer/Storage_Upgrade_Button.hint_tooltip = storage_upgrade_tooltip
	$HBoxContainer/VBoxContainer/Advertisment_Upgrade_Button.hint_tooltip = advertisment_upgrade_tooltip
	$HBoxContainer/VBoxContainer/Shop_Upgrade_Button.hint_tooltip = shop_upgrade_tooltip
	$HBoxContainer/VBoxContainer/Sales_Tactics_Upgrade_Button.hint_tooltip = sales_tactics_tooltip


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
