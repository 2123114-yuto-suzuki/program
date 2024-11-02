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
				queue_free()
				Global.cupflag=1
				label_instance.change_text("コップを取った。\n飲み物があったら飲めるね。")
				
func _on_Cup_body_entered(_body):
	playerEntered = true
	label_instance.change_text("A:取る")

func _on_Cup_body_exited(_body):
	playerEntered = false

