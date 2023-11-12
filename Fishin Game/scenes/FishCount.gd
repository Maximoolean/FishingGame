extends Label

func _ready():
	pass

func _process(_delta):
	self.text = "Fish: " + str(Global.fish)
