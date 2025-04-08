extends Node3D

# Node references
@export var hours_pointer: MeshInstance3D
@export var minutes_pointer: MeshInstance3D
@export var seconds_pointer: MeshInstance3D

# Rotation speeds (degrees per second)
const SECONDS_PER_HOUR = 3600.0
const SECONDS_PER_MINUTE = 60.0
const DEGREES_PER_HOUR = 360.0 / 12.0
const DEGREES_PER_MINUTE = 360.0 / 60.0
const DEGREES_PER_SECOND = 360.0 / 60.0

func _ready():
	# Start with current time
	var time = Time.get_time_dict_from_system()
	set_clock_time(time.hour, time.minute, time.second)

func _process(delta):
	# Animate the clock in real-time
	var time = Time.get_time_dict_from_system()
	set_clock_time(time.hour, time.minute, time.second)

func set_clock_time(hours: int, minutes: int, seconds: int):
	# Calculate rotations in degrees
	var hours_rotation = -hours * DEGREES_PER_HOUR - (minutes / 60.0) * DEGREES_PER_HOUR
	var minutes_rotation = -minutes * DEGREES_PER_MINUTE - (seconds / 60.0) * DEGREES_PER_MINUTE
	var seconds_rotation = -seconds * DEGREES_PER_SECOND
	
	# Apply rotations (Z-axis for clock hands)
	if hours_pointer:
		hours_pointer.rotation_degrees.z = hours_rotation
	if minutes_pointer:
		minutes_pointer.rotation_degrees.z = minutes_rotation
	if seconds_pointer:
		seconds_pointer.rotation_degrees.z = seconds_rotation
