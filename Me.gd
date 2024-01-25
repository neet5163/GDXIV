extends CharacterBody2D

const SPEED = 300.0
var last_direction = Vector2()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	# ビューポートのサイズを取得
	var viewport_size = get_viewport_rect().size
	# オブジェクトをビューポートの中央に配置
	position = viewport_size / 2
	

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * SPEED
	
	# キャラの向きの設定
	if abs(direction.x) < 0.1 and direction.y < -0.1:	#上↑
		set_rotation(PI * 0)
	elif direction.x > 0.1 and direction.y < -0.1:		#右上↑→
		set_rotation(PI * 1 / 4)
	elif direction.x > 0.1 and abs(direction.y) < 0.1:	#右→
		set_rotation(PI * 2 / 4)
	elif direction.x > 0.1 and direction.y > 0.1:		#右下↓→
		set_rotation(PI * 3 / 4)
	elif abs(direction.x) < 0.1 and direction.y > 0.1:	#下↓
		set_rotation(PI * 4 / 4)
	elif direction.x < -0.1 and direction.y < -0.1:		#左上↑←
		set_rotation(- PI * 1 / 4)
	elif direction.x < -0.1 and abs(direction.y) < 0.1:	#左←
		set_rotation(- PI * 2 / 4)
	elif direction.x < -0.1 and direction.y > 0.1:		#左下↓←
		set_rotation(- PI * 3 / 4)
	print(" get_rotation:",get_rotation(),"\n direction:",direction)
	
	move_and_slide()