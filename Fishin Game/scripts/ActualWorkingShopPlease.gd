extends Area2D

# Display the shop when player enters zone
func _on_area_entered(area):
	if area.is_in_group("Player"):
		get_node("Shop Interface").visible = true
		print("area_entered shop time")

# Hides the shop when player enters zone
func _on_area_exited(area):
	if area.is_in_group("Player"):
		get_node("Shop Interface").visible = false
