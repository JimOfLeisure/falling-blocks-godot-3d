extends RigidBody

const CIRCLE = 2 * PI
const SPEEDROTATEMAX = 5

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_spatial_material = SpatialMaterial.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var my_mesh = MeshInstance.new()
	my_mesh.name = "MeshInstance"
#	my_mesh.mesh = CubeMesh.new()
	var my_cube_mesh = CubeMesh.new()
#	my_cube_mesh.name = "CubeMesh"
	my_mesh.mesh =  my_cube_mesh
#	var my_spatial_material = SpatialMaterial.new()
	my_cube_mesh.material = my_spatial_material
	add_child(my_mesh)
	var my_collision = CollisionShape.new()
	my_collision.shape = BoxShape.new()
	add_child(my_collision)
	reset_position()
	reset_velocity()
	reset_rotation()
	reset_color()
	
func reset_position():
	translation.y = 20
	translation.x = randf() * 60 - 30
	translation.z = randf() * 60 - 30

func reset_velocity():
	linear_velocity = Vector3(0, 0, 0)
	angular_velocity = Vector3(randf() * SPEEDROTATEMAX, randf() * SPEEDROTATEMAX, randf() * SPEEDROTATEMAX)

func reset_rotation():
	rotation = Vector3(randf() * CIRCLE, randf() * CIRCLE, randf() * CIRCLE)
	
func reset_color():
	my_spatial_material.albedo_color = Color(randf(), randf(), randf(), 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if translation.y < -5:
		reset_position()
		reset_velocity()
		reset_rotation()
