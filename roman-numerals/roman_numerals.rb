class Integer
  ROMAN_NUMBERS = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def to_roman
    number = self
    roman_number = ""

    ROMAN_NUMBERS.each do |arabic_value, roman_value|
      while arabic_value <= number
        number -= arabic_value
        roman_number << roman_value
      end
    end

    roman_number
  end
end
