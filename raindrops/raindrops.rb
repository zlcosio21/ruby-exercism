module Raindrops
  def self.convert(number)
    sound = ""

    sound << "Pling" if (number % 3).zero?
    sound << "Plang" if (number % 5).zero?
    sound << "Plong" if (number % 7).zero?

    !sound.empty? ? sound : number.to_s
  end
end
