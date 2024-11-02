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
				label_instance.change_text("ドラムだ。\n一度やってみたかったんだよね。")
				if(Global.musicflag==0):
					Global.musicflag=1

func _on_Drum_body_entered(_body):
	playerEntered = true
	label_instance.change_text("A:鳴らす")

func _on_Drum_body_exited(_body):
	playerEntered = false
