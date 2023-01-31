# LibraryLaunchItem is a library-specific structure that describes how to launch
# a game.
@icon("res://assets/icons/box.svg")
extends Resource
class_name LibraryLaunchItem

signal added_to_library
signal removed_from_library

@export var _id: String
@export var _provider_id: String
@export var provider_app_id: String
@export var name: String
@export var command: String
@export var args: PackedStringArray
@export var env: Dictionary
@export var cwd: String
@export var tags: PackedStringArray
@export var categories: PackedStringArray
@export var installed: bool


# Returns the given launch item as a dictionary for serialization
func to_dict() -> Dictionary:
	return {
		"_id": _id,
		"_provider_id": _provider_id,
		"provider_app_id": provider_app_id,
		"name": name,
		"command": command,
		"args": args,
		"env": env,
		"cwd": cwd,
		"tags": tags,
		"categories": categories,
		"installed": installed,
	}


# Returns a new LibraryLaunchItem from the given dictionary
static func from_dict(d: Dictionary) -> LibraryLaunchItem:
	var item := LibraryLaunchItem.new()
	item._id = d["_id"]
	item._provider_id = d["_provider_id"]
	item.provider_app_id = d["provider_app_id"]
	item.name = d["name"]
	item.command = d["command"]
	item.args = d["args"]
	item.env = d["env"]
	item.cwd = d["cwd"]
	item.tags = d["tags"]
	item.categories = d["categories"]
	item.installed = d["installed"]
	return item
