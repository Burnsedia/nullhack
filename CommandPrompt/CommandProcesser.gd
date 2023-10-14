extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func process_command(input:String):
	var words = input.split(" ", false)
	if words.size() == 0:
		return "Error: command not reconized"
	
	var first_word = words[0].to_lower()
	var second_word = " "
	
	if words.size() > 1:
		second_word = words[1].to_lower()
	match first_word:
		"go":
			return go(second_word)
		"map":
			return map(second_word)
		_:
			return "Unreconized Command"
		
func go(dir:String) -> String:
	if dir == " ":
		return "Go where?"
		
	return "You went %s" % dir
	
func map(local:String) -> String:
	return "You located at unkown %s" % local
	
	
	
