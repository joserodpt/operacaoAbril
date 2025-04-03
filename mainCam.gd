extends Camera3D

@export var target_position: Vector3 = Vector3(5, 3, -10)  # Target position
@export var target_rotation: Vector3 = Vector3(0, 90, 0)  # Target rotation in degrees
@export var duration: float = 2.0  # Duration in seconds

func _ready():
	var tween = get_tree().create_tween().set_parallel(true)  # Enable parallel animation
	
	# Smooth translation
	tween.tween_property(self, "global_transform:origin", target_position, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	# Smooth rotation (convert degrees to radians)
	var target_basis = Basis.from_euler(target_rotation * deg_to_rad(1))
	tween.tween_property(self, "global_transform:basis", target_basis, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
