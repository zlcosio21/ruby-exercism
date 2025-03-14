class CharacterOrderError < ArgumentError
  def initialize(message = "The starting character must come before the ending character in the given range.")
    super
  end
end

class Diamond
  START_CHARACTER = "A"
  SPACE = ' '

  def self.make_diamond(letter, start = START_CHARACTER)
    new(letter, start).to_s
  end

  private

  attr_accessor :letter, :start, :diamond

  def initialize(letter, start = START_CHARACTER)
    self.letter = letter
    self.start = start
    self.diamond = top_half + bottom_half
  end

  def start_letter_available?
    start.upcase <= letter.upcase
  end

  def range_characters
    raise CharacterOrderError unless start_letter_available?

    [*(start..letter)]
  end

  def top_half
    characters = range_characters
    letter_position = characters.index(letter)

    padding = SPACE * letter_position
    top_half = "%s%s%s\n" % [padding, characters[0], padding]

    count_sides = letter_position - 1
    count_middle = 1

    (characters[1..letter_position]).each do |current_letter|
      padding = SPACE * count_sides
      middle_space = SPACE * count_middle

      top_half << "%s%s%s%s%s\n" % [padding, current_letter, middle_space, current_letter, padding]

      count_sides -= 1
      count_middle += 2
    end

    top_half
  end

  def bottom_half
    top_half.lines[0..-2].reverse.join
  end

  public

  def to_s
    diamond
  end
end
