extends Timer

func chameiTimer ():
	if scriptGlobal.timer:
		print("na func e no if")
		scriptGlobal.inArea = false
		start()
		while (time_left != 0):
			scriptGlobal.inArea = false
			if (time_left == 0):
				scriptGlobal.inArea = true
				pass
			pass
		pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
