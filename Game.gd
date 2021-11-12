extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const InputResponse = preload("res://InputResponse.tscn")

onready var history_rows = $"Panel/MarginContainer/Rows/GameInfo/HistoryRows"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LineEdit_text_entered(new_text):
	var input_response = InputResponse.instance()
	input_response.set_text(new_text, "Test test")
	history_rows.add_child(input_response)
