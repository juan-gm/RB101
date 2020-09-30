def reverse!(arr)
  top_index = arr.size / 2
  pos_counter = 0
  neg_counter = -1
  while (-neg_counter) <= top_index
    aux = arr[pos_counter]
    arr[pos_counter] = arr[neg_counter]
    arr[neg_counter] = aux
    # En vez de esto de arriba con una auxiliar, podemos
    # hacer esto:
    # arr[pos_counter], arr[neg_counter] = arr[neg_counter], arr[pos_counter]
    pos_counter += 1
    neg_counter -= 1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e", "b", "a"]

list = ['abc']
puts reverse!(list) == ["abc"]
puts list == ["abc"]

list = []
puts reverse!(list) == []
puts list == []

puts "-------------------------------------------"

def reverse(original_arr)
  arr = original_arr.clone
  top_index = arr.size / 2
  pos_counter = 0
  neg_counter = -1
  while (-neg_counter) <= top_index
    aux = arr[pos_counter]
    arr[pos_counter] = arr[neg_counter]
    arr[neg_counter] = aux
    # En vez de esto de arriba con una auxiliar, podemos
    # hacer esto:
    # arr[pos_counter], arr[neg_counter] = arr[neg_counter], arr[pos_counter]
    pos_counter += 1
    neg_counter -= 1
  end
  arr
end


puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]

puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true