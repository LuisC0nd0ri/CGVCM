extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#self.loop = true  # Asegura que la música se reproduzca en bucle
	play()  # Inicia la reproducción


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
