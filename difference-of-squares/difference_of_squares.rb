class Squares
  private

  attr_reader :number

  def initialize(number)
    @number = (1..number)
  end

  public

  def square_of_sum
    number.sum ** 2
  end

  def sum_of_squares
    number.map { |num| num ** 2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
