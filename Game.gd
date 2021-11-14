extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const InputResponse = preload("res://InputResponse.tscn")

export(int) var max_lines_saved := 32

var max_scroll_length := 0

onready var history_rows = $"Panel/MarginContainer/Rows/GameInfo/ScrollContainer/HistoryRows"
onready var scroll = $"Panel/MarginContainer/Rows/GameInfo/ScrollContainer"
onready var scrollbar = scroll.get_v_scrollbar()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scrollbar.connect("changed", self, "scrollbar_changed")
	max_scroll_length = scrollbar.max_value


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func scrollbar_changed():
	if max_scroll_length != scrollbar.max_value:
		max_scroll_length = scrollbar.max_value
		scroll.scroll_vertical = scrollbar.max_value 


func _on_LineEdit_text_entered(new_text):
	if new_text.empty():
		return
	var input_response = InputResponse.instance()
	input_response.set_text(new_text, "Test test")
	if history_rows.get_child_count() > max_lines_saved:
		var rows_to_ignor = history_rows.get_child_count() - max_lines_saved
		for _i in range(rows_to_ignor):
			history_rows.get_child(_i).queue_free()
	history_rows.add_child(input_response)
