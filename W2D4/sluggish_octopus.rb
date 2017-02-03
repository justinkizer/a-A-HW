# Big O-ctopus and Biggest Fish
#
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
#
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus!(array)
  sorted = false
  until sorted
    sorted = true
    array.each_index do |index|
      index_2 = index + 1
      next if index_2 == array.length
      if array[index].length > array[index_2].length
        array[index],array[index_2] = array[index_2],array[index]
        sorted = false
      end
    end
  end
  array[-1]
end

# result = []
# array.each do |fish|
#   result << fish if result.last.nil? || fish.length > result.sort.last.length
# end
# result.last
