tool
extends Container
class_name SliderMargin # A container with a margin that expands and shrinks relative to the container's size. Perfect for CSS nerds.

export (float, 0.0, 1.0, 0.001) var horizontal_margin = 1.0 setget edit_horizontal_margin
export (float, 0.0, 1.0, 0.001) var vertical_margin = 1.0 setget edit_vertical_margin

func _notification(what):
	if what == NOTIFICATION_SORT_CHILDREN:
		self._on_sort_children()

func edit_horizontal_margin(slider_input:float):
	horizontal_margin = slider_input
	_on_sort_children()

func edit_vertical_margin(slider_input:float):
	vertical_margin = slider_input
	_on_sort_children()

func _on_sort_children():
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
