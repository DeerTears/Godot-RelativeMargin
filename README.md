# Godot-RelativeMargin
An easier-to-use MarginContainer that expands and shrinks the margin relative to the container's size. Perfect for CSS nerds.

RelativeMargin gives you two sliders to adjust the horizontal and vertical margins based on a percentage rather than an absolute pixel value. The size of the children will adjust appropriately as this container gets resized.

After applying the margins, this container then maximizes the size of its children and centers them.

## Variables

**Horizontal Margin** - A slider that adjusts the left and right margins of all children.

**Vertical Margin** - A slider that adjusts the top and bottom margins of all children.

Both sliders go from 0.000 to 1.000 in steps of 0.001.

## Notes

The first release of this node featured the ability to adjust each margin independently (left, right, bottom, top). I removed this feature because the information the individual margins displayed often conflicted with the main horizontal and vertical margin sliders. It was functional, but confusing. You can find this first version in the releases page of this repository.

I will eventually implement relative margins for each individual sides of the container, either in the main node, or as a separate node.
