extends StaticBody2D

var speed_upgrade_cost = 5.0
var conversion_upgrade_cost = 5.0

# Start the animation for the speed upgrade and set the price labels
func _ready():
	$icon.play("speedanim")
	get_node("Speed Price").text = str(speed_upgrade_cost)
	get_node("Convert Price").text = str(conversion_upgrade_cost)


# Sell your fish button
func _on_sell_button_pressed():
	Global.money += Global.fish*Global.income
	Global.fish = 0

# Purchases a speed upgrade
func _on_speed_button_pressed():
	if Global.money >= speed_upgrade_cost:
		Global.money -= speed_upgrade_cost
		Global.fishing_speed -= 1
		speed_upgrade_cost *= 2
		get_node("Speed Price").text = str(speed_upgrade_cost)

# Purchases a sell price upgrade
func _on_conversion_button_pressed():
	if Global.money >= conversion_upgrade_cost:
		Global.money -= conversion_upgrade_cost
		Global.income *= 2
		conversion_upgrade_cost *= 2
		get_node("Convert Price").text = str(conversion_upgrade_cost)
