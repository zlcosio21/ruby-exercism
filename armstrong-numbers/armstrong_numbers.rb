module ArmstrongNumbers
  def self.include?(number)
    number = number.to_s

    number.to_i == number.chars.sum { |num| num.to_i  ** number.length }
  end
end
