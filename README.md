# Godot-PercentMarginContainer
A simpler, faster-to-use MarginContainer that uses percentages rather than pixels. Inspired by CSS.

PercentMargin gives you two sliders to adjust the horizontal and vertical margins based on a percentage rather than an absolute pixel value. The size of the children will adjust appropriately as this container gets resized.

## Variables

**Horizontal Margin** - A slider that changes the multiplier of the children's horizontal margin. The slider goes from 0.000 to 1.000 in steps of 0.001. Use individual margins for more precision if needed.

**Vertical Margin** - A slider that changes the multiplier of the children's vertical margin. The slider goes from 0.000 to 1.000 in steps of 0.001. Use individual margins for more precision if needed.

**Individual Margins** - A dictionary that allows each margin multiplier: `left`, `right`, `top`, `bottom`, to be adjusted as needed. The changes made in this dictionary will not take effect until "Use Individual Margins" is checked.

Note: I reccomend you close this dictionary once you are finished adjusting its values. The dictionary values will not accurately update if "Use Individual Margins" is unchecked and the sliders are used once again.

**Use Individual Margins** - A checkbox that toggles which numbers the PercentMargin uses as the margins for its children. Checking this box will use the numbers kept in the Individual Margins dictionary, while unchecking this box will refer to the slider values. Keeping this box checked will prevent the sliders from updating the Individual Margins.

## Notes

As a general workflow, it is recommended you use the Horizontal and Vertical sliders first, open the dictionary, click "Use Individual Margins", adjust the dictionary as needed, then close the dictionary when done. If you need to use the sliders again, uncheck "Use Individual Margins".

Although adjusting the margin sliders after adjusting Individual Margins will cause Individual Margins to update, the Individual Margin numbers will not represent their in-code values until the Dictionary is closed and re-opened (or the inspector window switches to another node and back). Clicking on the `Dictionary (size 4)` in the inspector twice to close and open the contents. It is my hope that the "Use Individual Margins" toggle is sufficient for having control over these variables without losing information in the process.

#### Issues

The inclusion of the "Use Individual Margins" is a hacky solution to mask the fact that the "Individual Margins" Dictionary isn't automatically updated when the two sliders are used. I attempted to make a system where "Use Individual Margins" unchecked itself whenever the sliders were moved for the sake of usability, but this created more confusion because this checkbox also could not be updated (without refreshing the window) to reflect the real state of the variables. I would love to have help figuring out a good solution for this problem.

The current numbers can be reflected in the inspector by clicking on the Dictionary header twice to refresh the contents. Alternatively, adjusting the individual margins after either slider is used will still refer to the numbers present in the individual margins.

