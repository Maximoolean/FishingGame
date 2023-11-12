extends Label

func _ready():
	pass

func _process(_delta):
	self.text = "Money: " + str(Global.money)
