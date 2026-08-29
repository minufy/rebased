Input.refresh = Input.new({"f5"})

Input.right = Input.new({"right", "d"})
Input.left = Input.new({"left", "a"})
-- Input.up = NewInput({"up", "w"})
Input.down = Input.new({"down", "s"})
Input.jump = Input.new({"space", "up", "w", "lshift"})

Audio.new("jump")

Camera.x_damp = 0.1
Camera.y_damp = 0.1
Camera.shake_damp = 0.3

TILE_SIZE = 16
TILE_NAMES = {
    "tile",
}

DECAL_NAMES = {
    "test",
}