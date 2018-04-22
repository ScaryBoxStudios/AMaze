extends Node

var AddPlayerNodeScene
signal done_pressed

func add_new_add_node():
    var n = AddPlayerNodeScene.instance()
    n.connect("add_pressed", self, "_handle_add_player_pressed")
    $ScrollContainer/VBoxContainer.add_child(n)
    pass

#
# Callbacks
#
func _ready():
    AddPlayerNodeScene = preload("res://scenes/AddPlayer/AddPlayerNode.tscn")
    add_new_add_node()

func _handle_add_player_pressed(name):
    add_new_add_node()
    print(name)

func _on_TextureButton_pressed():
    var names = Array()
    for i in $ScrollContainer/VBoxContainer.get_children():
        names.append(i.player_name)

    emit_signal("done_pressed", names)
    print(names)
