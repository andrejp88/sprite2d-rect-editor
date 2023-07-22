extends EditorInspectorPlugin


var undo_redo: EditorUndoRedoManager


func _init(undo_redo: EditorUndoRedoManager) -> void:
	self.undo_redo = undo_redo


func _can_handle(object: Object) -> bool:
	return object is Sprite2D


func _parse_group(object: Object, group: String) -> void:
	var sprite := object as Sprite2D
	if group == "Region":
		var button := Button.new()
		button.text = "Autorect"
		button.pressed.connect(
			func():
				var desired_rect = Rect2(Vector2.ZERO, sprite.texture.get_size())
				if sprite.region_enabled and sprite.region_rect == desired_rect:
					print_debug("Sprite2D Rect Editor: Region is already enabled and set to the full texture size")
					return

				undo_redo.create_action("Sprite2D Rect Editor: Autorect", UndoRedo.MERGE_ENDS)
				undo_redo.add_do_property(sprite, "region_enabled", true)
				undo_redo.add_undo_property(sprite, "region_enabled", sprite.region_enabled)
				undo_redo.add_do_property(sprite, "region_rect", desired_rect)
				undo_redo.add_undo_property(sprite, "region_rect", sprite.region_rect)
				undo_redo.commit_action()
		)
		add_custom_control(button)
