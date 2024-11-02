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
				if(Global.cupflag==1):
					show()
					Global.cupflag=2
					Global.setflag+=1
					label_instance.change_text("コップを土台に置いた。")
				if(Global.clockflag==2):
						label_instance.change_text("鍵が一つ開いた！")

func _on_Cup_body_entered(_body):
	label_instance.change_text("A:置く")
	playerEntered = true

func _on_Cup_body_exited(_body):
	playerEntered = false

