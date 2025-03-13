class PhoneNumber
  INVALIDE_CODES = ["0", "1"].freeze

  def self.clean(number)
    new(number).to_s
  end

  attr_accessor :number

  def initialize(number)
    @number = number.gsub(/\D/, '')
  end

  private

  def valid_number?(first_digit, exchange_code)
    number.length == 10 && !INVALIDE_CODES.include?(first_digit) && !INVALIDE_CODES.include?(exchange_code)
  end

  def validate
    if number.start_with?("1")
      self.number = number[1..]
    end

    first_digit = number[0]
    exchange_code = number[3]

    valid_number?(first_digit, exchange_code) ? number : nil
  end

  public

  def to_s
    validate
  end
end
