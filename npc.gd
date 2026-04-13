extends Node2D

@export
var timeline : DialogicTimeline;
var player : Node2D;
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
func interact()->void:
	if Dialogic.current_timeline == null:
		Dialogic.start(timeline);
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") && player.position.distance_to(position)< 150:
		interact();
		get_viewport().set_input_as_handled();
