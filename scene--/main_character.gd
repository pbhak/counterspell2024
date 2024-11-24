extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var loads = load("res://screens/scene2.tscn")
@export var exports := {
	"torch": 0,
	"gun" : 0,
	
}

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

		
var exited = false;
func _on_scene_switch_body_entered(body: Node2D) -> void:
	#switch scene
	var exited = true;
	get_tree().change_scene_to_packed(loads)

#func _process(_delta):
	#if exited == true:
		#print('false')
		#get_tree().change_scene_to_packed(loads)


#func _on_torch_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	
