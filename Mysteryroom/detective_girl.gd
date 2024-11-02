extends RigidBody
export var speed =7.5
var label_instance: Label3D

var velocity =Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$detective_girl/AnimationPlayer.play("Idle")
	label_instance = get_node("/root/Main/RigidBody/Label3D")
	pass # Replace with function body.

func _physics_process(_delta):
	var direction=Vector3.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.z-=1
		label_instance.change_text("")
	if Input.is_action_pressed("ui_left"):
		direction.z+=1
		label_instance.change_text("")
	if Input.is_action_pressed("ui_down"):
		direction.x+=1
		label_instance.change_text("")
	if Input.is_action_pressed("ui_up"):
		direction.x-=1
		label_instance.change_text("")
		
	if direction !=Vector3.ZERO:
		$detective_girl/AnimationPlayer.play("Walk")
		direction=direction.normalized()
		$detective_girl.look_at(translation-direction,Vector3.UP)
		
	velocity.x=-(direction.x*speed)
	velocity.z=-(direction.z*speed)
	
	print(velocity.x);
	print(velocity.z);
		
	add_central_force(velocity)
