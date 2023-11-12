extends Label

func _ready():
	pass

# Change the text of the label
func _process(_delta):
	self.text = "Money: " + str(Global.money)
