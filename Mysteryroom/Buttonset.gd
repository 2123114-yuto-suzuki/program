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
				if(Global.buttonflag==0):
					Global.buttonflag=1
					label_instance.change_text("ボタンを押した。\n鍵が一つ開いた！")

func _on_Button_body_entered(_body):
	playerEntered = true
	print("プレイヤーがエリアに侵入しました")

func _on_Button_body_exited(_body):
	playerEntered = false
	print("プレイヤーがエリアから出ました。")
