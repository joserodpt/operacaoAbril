extends Node3D

@onready var left_reel = get_node("Sketchfab_model/a5646361d3974a718e2e09ab2c4b80eb_fbx/RootNode/PI_REC_WHEEL_A")
@onready var right_reel = get_node("Sketchfab_model/a5646361d3974a718e2e09ab2c4b80eb_fbx/RootNode/PI_REC_WHEEL_B")
@export var spin_speed: float = 100.0  # Degrees per second

var spinning := true  # Whether the reels are spinning

func toggle_spin():
	spinning = !spinning

func _process(delta):
	if spinning && left_reel != null && right_reel != null:
		left_reel.rotate_z(deg_to_rad(-spin_speed * delta))  # Rotate counterclockwise
		right_reel.rotate_z(deg_to_rad(-spin_speed * delta))  # Rotate clockwise

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	print("cliquei!")
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		toggle_spin()


func enterMouse() -> void:
	print("loool")
	pass # Replace with function body.
