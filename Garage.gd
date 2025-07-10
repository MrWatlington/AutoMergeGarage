extends Control
@export var car_scene: PackedScene

func _ready():
    spawn_car()
    spawn_car()

func spawn_car():
    var car = car_scene.instantiate()
    car.update_display()
    var slot = get_empty_slot()
    if slot:
        slot.add_child(car)

func get_empty_slot():
    for slot in $MainLayout/GarageGrid.get_children():
        if slot.get_child_count() == 0:
            return slot
    return null

func _on_SpawnButton_pressed():
    spawn_car()
