# Big O-ctopus and Biggest Fish
#
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Clever Octopus
#
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(array)
  longest_fish = ""
    array.each do |fish|
      longest_fish = fish if fish.length > longest_fish.length
    end
  longest_fish
end
