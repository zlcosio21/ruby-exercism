class Transpose
  def self.transpose(input)
    return input if input.empty?

    lines = input.split("\n")
    num_rows = lines.length

    max_length = lines.map(&:size).max
    transposed_rows = []

    (0...max_length).each do |col_index|
      transposed_rows[col_index] = ""

      (0...num_rows).each do |row_index|
        if lines[row_index][col_index].nil?
          transposed_rows[col_index] << "\0"
        else
          transposed_rows[col_index] << lines[row_index][col_index]
        end
      end
    end

    adjust_matrix(transposed_rows)
  end

  def self.adjust_matrix(transposed_rows)
    matrix = transposed_rows.join("\n")
    matrix = matrix.gsub(/\0+$/, "")
    matrix.gsub("\0", " ")
  end
end
