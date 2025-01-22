class Isogram
  def self.isogram?(input)
    letters = input.downcase.scan(/\w/)
    letters.uniq.length == letters.length
  end
end