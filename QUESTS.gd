extends Node

var caged_friend_keys := []

var last_quest_id := 0

func generate_id()-> int:
	last_quest_id += 1
	return last_quest_id
