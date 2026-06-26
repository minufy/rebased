Input.right = NewInput({"right", "d"})
Input.left = NewInput({"left", "a"})
-- Input.up = NewInput({"up", "w"})
Input.down = NewInput({"down", "s"})
Input.jump = NewInput({"space", "up", "w", "lshift"})

-- NewAudio("jump")

Camera.x_damp = 0.1
Camera.y_damp = 0.1
Camera.shake_damp = 0.2

TILE_SIZE = 16
TILE_NAMES = {
    "tile",
}

ENTITIY_NAMES = {
    "player",
    "cam_zone",
}

DECAL_NAMES = {
    "test",
}