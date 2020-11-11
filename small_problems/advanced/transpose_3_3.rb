require 'pry'

def transpose(matrix)
  sol = []
  matrix.each do |array|
    sol << array.clone
  end

  
  false_array = Array.new(3, false)
  changed = []
  3.times { changed << false_array.clone }
  
  sol.each_with_index do |arr, index|
    arr.each_with_index do |num, i|
      if !changed[index][i]
        sol[index][i], sol[i][index] = sol[i][index], sol[index][i]
        changed[i][index] = true
      end
    end
  end
  sol
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p matrix
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]