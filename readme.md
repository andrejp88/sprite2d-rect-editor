# Sprite2D Rect Editor

When a Sprite2D is selected for editing, additional handles will appear on each
side of the Sprite2D. Dragging these handles will resize the region rect in the
given direction and reposition the entire Sprite2D node such that the opposite
edge stays put.

The Sprite2D must have `region_enabled` checked and `global_rotation` set to a
multiple of 2π (e.g. 0).
