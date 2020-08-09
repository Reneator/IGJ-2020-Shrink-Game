extends PanelContainer

onready var delivery_upgrade = $HBoxContainer/VBoxContainer/Delivery_Upgrade_Button
onready var storage_upgrade = $HBoxContainer/VBoxContainer/Storage_Upgrade_Button
onready var advertisment_upgrade = $HBoxContainer/VBoxContainer/Advertisment_Upgrade_Button
onready var shop_upgrade = $HBoxContainer/VBoxContainer/Shop_Upgrade_Button
onready var sales_tactics = $HBoxContainer/VBoxContainer/Sales_Tactics_Upgrade_Button

func _process(delta):
	var delivery_upgrade_tooltip = Global_2.get_delivery_upgrade_tooltip()
	var storage_upgrade_tooltip = Global_2.get_storage_upgrade_tooltip()
	var advertisment_upgrade_tooltip = Global_2.get_customer_rate_upgrade_tooltip()
	var shop_upgrade_tooltip = Global_2.get_shop_upgrade_tooltip()
	var sales_tactics_tooltip = Global_2.get_sales_efficiency_upgrade_tooltip()
	delivery_upgrade.hint_tooltip = delivery_upgrade_tooltip
	storage_upgrade.hint_tooltip = storage_upgrade_tooltip
	advertisment_upgrade.hint_tooltip = advertisment_upgrade_tooltip
	shop_upgrade.hint_tooltip = shop_upgrade_tooltip
	sales_tactics.hint_tooltip = sales_tactics_tooltip
	refresh_disables()

func refresh_disables():
	delivery_upgrade.disabled = !Global_2.can_pay(Global_2.get_delivery_upgrade_cost())
	storage_upgrade.disabled = !Global_2.can_pay(Global_2.get_storage_upgrade_cost())
	advertisment_upgrade.disabled = !Global_2.can_pay(Global_2.get_customer_rate_upgrade_cost())
	shop_upgrade.disabled = !Global_2.can_pay(Global_2.get_upgrade_shop_cost())
	sales_tactics.disabled = !Global_2.can_pay(Global_2.get_sales_efficiency_cost())
		


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
