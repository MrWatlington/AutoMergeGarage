extends Control
@export var car_level := 1

var dragging := false
var drag_offset := Vector2.ZERO

func _ready():
    $LevelLabel.text = "MK%d" % car_level
    add_to_group("cars")

func _gui_input(event):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        if event.pressed:
            dragging = true
            drag_offset = get_global_mouse_position() - global_position
            raise()
        else:
            dragging = false
            check_merge()

func _process(_delta):
    if dragging:
        global_position = get_global_mouse_position() - drag_offset

func check_merge():
    var hovered = get_viewport().gui_get_hovered_control()
    if hovered and hovered != self and hovered.is_in_group("cars"):
        if hovered.car_level == car_level:
            hovered.car_level += 1
            hovered.update_display()
            queue_free()

func update_display():
    $LevelLabel.text = "MK%d" % car_level
