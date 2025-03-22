class BottleSong
  NUMBERS = {
    0 => "no",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten"
  }

  def self.recite(bottles, num_verses)
    new(bottles, num_verses).to_s
  end

  attr_reader :bottles, :num_verses

  def initialize(bottles, num_verses)
    @bottles = bottles
    @num_verses = num_verses
  end

  private

  def pluralize_bottle(num)
    num == 1 ? "bottle" : "bottles"
  end

  def recite
    starting_bottle = (bottles - num_verses) + 1

    verses = (starting_bottle..bottles).reverse_each.map do |num|
      <<~VERSE
        #{NUMBERS[num].capitalize} green #{pluralize_bottle(num)} hanging on the wall,
        #{NUMBERS[num].capitalize} green #{pluralize_bottle(num)} hanging on the wall,
        And if one green bottle should accidentally fall,
        There'll be #{NUMBERS[num - 1]} green #{pluralize_bottle(num - 1)} hanging on the wall.
      VERSE
    end

    verses.join("\n")
  end

  public

  def to_s
    recite
  end
end
