# Dancing Octopus
#
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:
#
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.
#
# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3
# When you're finished, check out the solutions!

new_tiles_data_structure = {"up" => 0, "right-up": 1, right: 2, right_down: 3, down: 4, left_down: 5, left: 6, left_up: 7}

def fast_dance(direction, new_tiles_data_structure)
  new_tiles_data_structure[direction]
end
