# Godot-SliderMargin
An easier-to-use MarginContainer that expands and shrinks the margin relative to the container's size. Perfect for CSS nerds.

SliderMargin gives you two sliders to adjust the horizontal and vertical margins based on a percentage rather than an absolute pixel value. The size of the children will adjust appropriately as this container gets resized.

## Variables

**Horizontal Margin** - A slider that adjusts the left and right margins of all children, centering them.

**Vertical Margin** - A slider that adjusts the top and bottom margins of all children, centering them.

Both sliders go from 0.000 to 1.000 in steps of 0.001.

## Notes

There was an older node in the branches of this repo that featured the ability to adjust each margin independently alongside the uniform sliders. I split this feature into two nodes because mixing two competing logics for the node's variables was cumbersome, since it's mostly just plugin scripts that can update an editor property in front of the user's eyes. It was hacky and complicated and was dropped to keep the node simple. This feature will return in its own node also kept in this repository.
