#extends Node
extends PanelContainer

var console: RichTextLabel
signal printToConsole(text)

# Function to print a line of text to the console
func printLine(lineText: String) -> void:
	console.append_text("[color=#ffffff]" + lineText + "[/color]\n")
	
func clear() -> void:
	console.clear()

# Called when the node enters the scene tree for the first time
func _ready():
	# Create a RichTextLabel
	console = RichTextLabel.new()
	console.bbcode_enabled = true
	console.bbcode_text = "[color=#ffffff]Welcome to the Console[/color]\n"
	self.add_child(console)

	# Set text color and background color for the RichTextLabel
	console.add_theme_color_override("font_color", Color(1, 1, 1))
	console.add_theme_color_override("background_color", Color(1, 1, 1))

	# Set border properties for the PanelContainer
	var style_box = StyleBoxFlat.new()
	style_box.border_color = Color(1, 1, 1)
	self.theme = Theme.new()
	self.theme.set_stylebox("panel", "normal", style_box)
