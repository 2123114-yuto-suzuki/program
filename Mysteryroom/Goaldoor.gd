extends Area

var goalflag=0

var playerEntered: bool = false
var label_instance: Label3D

func _ready():
	set_process_input(true)
	label_instance = get_node("/root/Main/RigidBody/Label3D")

func _input(event):
	if(Global.musicflag==3 && Global.setflag==2 && Global.buttonflag==1 && goalflag==0):
		goalflag=1
		label_instance.change_text("鍵が全部開いたみたい!\nこれで出られる!")
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.scancode == KEY_A and key_event.pressed:
			if playerEntered:
				if(goalflag==0):
					label_instance.change_text("出口のドアだ。\n鍵がかかって出られない。")
				if(goalflag==1):
					get_tree().change_scene("res://sence/GameClear.tscn")

func _on_Goaldoor_body_entered(_body):
	playerEntered = true
	label_instance.change_text("A:調べる")

func _on_Goaldoor_body_exited(_body):
	playerEntered = false
