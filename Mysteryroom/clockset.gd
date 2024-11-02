extends Area


var playerEntered: bool = false
var label_instance: Label3D

func _ready():
	set_process_input(true)
	label_instance = get_node("/root/Main/RigidBody/Label3D")

func _input(event):
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.scancode == KEY_A and key_event.pressed:
			if playerEntered:
				if(Global.clockflag==1):
					show()
					Global.clockflag=2
					Global.setflag+=1
					label_instance.change_text("時計を土台に置いた。")
				if(Global.cupflag==2):
					label_instance.change_text("鍵が一つ開いた！")

func _on_clock_body_entered(_body):
	playerEntered = true
	label_instance.change_text("A:置く")

func _on_clock_body_exited(_body):
	playerEntered = false
