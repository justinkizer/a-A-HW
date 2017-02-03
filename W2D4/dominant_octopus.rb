# Big O-ctopus and Biggest Fish
#
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Dominant Octopus
#
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.

def dominant_octopus(array)
  merge_sort(array)[-1]
end

def merge_sort(array)
  return array if array.length <= 1
  mid = array.length / 2
  left = array.take(mid)
  right = array.drop(mid)
  s_left = merge_sort(left)
  s_right = merge_sort(right)
  merged(s_left, s_right)
end

def merged(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first.length < right.first.length
      merged << left.shift
    else
      merged << right.shift
    end
  end
  merged + left + right
end
