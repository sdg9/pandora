@tool
extends EditorPlugin

const PandoraEditor := preload("res://addons/pandora/ui/editor/PandoraEditor.tscn")
const PandoraIcon := preload("res://addons/pandora/icons/pandora-icon.svg")

var editor_view


func _init() -> void:
	self.name = 'PandoraPlugin'


func _enter_tree() -> void:
	add_autoload_singleton("PandoraSettings", "res://addons/pandora/settings/PandoraSettings.gd")
	add_autoload_singleton("Pandora", "res://addons/pandora/PandoraSingleton.tscn")
	editor_view = PandoraEditor.instantiate()
	editor_view.plugin_reference = self
	editor_view.hide()
	get_editor_interface().get_editor_main_screen().add_child(editor_view)
	_make_visible(false)


func _exit_tree() -> void:
	if editor_view:
		remove_control_from_bottom_panel(editor_view)
		editor_view.queue_free()


func _make_visible(visible:bool) -> void:
	if editor_view:
		editor_view.visible = visible


func _has_main_screen() -> bool:
	return true


func _get_plugin_name() -> String:
	return "Pandora"
	

func _get_plugin_icon() -> Texture2D:
	return PandoraIcon