extends Resource
class_name KeyboardKeyConfig

# Defines the key type
enum TYPE {
	CHAR,
	SPECIAL,
}

enum ACTION {
	ENTER,
	TAB,
}

@export var type: TYPE = TYPE.CHAR
@export var output: String
@export var output_uppercase: String
@export var display: String
@export var display_uppercase: String
@export var icon: Texture2D
@export var stretch_ratio: float = 1

func _init(out: String = "", out_upper: String = "", disp: String = out, 
		disp_upper: String = out_upper, t: TYPE = TYPE.CHAR, ico: Texture2D = null, 
		str_ratio: float = 1) -> void:
	type = t
	output = out
	output_uppercase = out_upper
	display = disp
	display_uppercase = disp_upper
	icon = ico
	stretch_ratio = str_ratio
