require 'pry'

def transpose(matrix)
  sol = []
  matrix.each do |array|
    sol << array.clone
  end

  
  false_array = Array.new(matrix[0].size, false)
  changed = []
  matrix.size.times { changed << false_array.clone }
  
  sol.each_with_index do |arr, index|
    arr.each_with_index do |num, i|
      if !changed[index][i]
        binding.pry
        sol[index][i], sol[i][index] = sol[i][index], sol[index][i]
        changed[i][index] = true
      end
    end
  end
  sol
end

transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]