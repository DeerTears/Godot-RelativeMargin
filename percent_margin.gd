tool
extends Container
class_name PercentMargin

export (float, 0.0, 1.0, 0.001) var horizontal_margin = 1.0 setget edit_horizontal_margin
export (float, 0.0, 1.0, 0.001) var vertical_margin = 1.0 setget edit_vertical_margin

export var use_individual_margins: bool = false setget edit_use_indie_margins
export var individual_margins: Dictionary = {
	"Left":		1.0,
	"Right":	1.0,
	"Top":		1.0,
	"Bottom":	1.0,
} setget edit_individual_margins

enum editing {H, V, NONE,}
var currently_editing: int = editing.H

func _init():
	if is_connected("sort_children",self,"_on_PercentMargin_sort_children") == false:
		connect("sort_children",self,"_on_PercentMargin_sort_children")

func edit_horizontal_margin(input:float):
	horizontal_margin = input
	currently_editing = editing.H
	_on_PercentMargin_sort_children()

func edit_vertical_margin(input:float):
	vertical_margin = input
	currently_editing = editing.V
	_on_PercentMargin_sort_children()

func edit_use_indie_margins(input:bool):
	use_individual_margins = input
	if input:
		edit_individual_margins(individual_margins)
	else:
		_on_PercentMargin_sort_children()

func edit_individual_margins(new_margins:Dictionary):
	individual_margins["Left"] = new_margins["Left"]
	individual_margins["Top"] = new_margins["Top"]
	individual_margins["Right"] = new_margins["Right"]
	individual_margins["Bottom"] = new_margins["Bottom"]
	currently_editing = editing.NONE
	if use_individual_margins == false:
		return
	var child_count = get_child_count()
	for i in child_count:
		var current_child = get_child(i)
		var left_movement = lerp(rect_size.x, 0.0, individual_margins["Left"])
		var top_movement = lerp(rect_size.y, 0.0, individual_margins["Top"])
		var right_movement = lerp(rect_size.x, 0.0, individual_margins["Right"])
		var bottom_movement = lerp(rect_size.y, 0.0, individual_margins["Bottom"])
		current_child.margin_right = -right_movement + (right_movement/2)
		current_child.margin_left = left_movement - (left_movement/2)
		current_child.margin_top = top_movement - (top_movement/2)
		current_child.margin_bottom = -bottom_movement + (bottom_movement/2)
		continue

func _on_PercentMargin_sort_children():
	if use_individual_margins == true:
		return
	var child_count = get_child_count()
	for i in child_count:
		var current_child = get_child(i)
		current_child.set_anchors_preset(Control.PRESET_WIDE)
		var horizontal_movement = lerp(rect_size.x, 0.0, horizontal_margin)
		var vertical_movement = lerp(rect_size.y, 0.0, vertical_margin)
		current_child.margin_right = -horizontal_movement + (horizontal_movement/2)
		current_child.margin_left = horizontal_movement - (horizontal_movement/2)
		current_child.margin_top = vertical_movement - (vertical_movement/2)
		current_child.margin_bottom = -vertical_movement + (vertical_movement/2)
		continue
	update_individual_margins()

func update_individual_margins():
	match currently_editing:
		editing.NONE:
			return
		editing.H:
			individual_margins["Left"] = horizontal_margin
			individual_margins["Right"] = horizontal_margin
		editing.V:
			individual_margins["Top"] = vertical_margin
			individual_margins["Bottom"] = vertical_margin
