class Triangle
  private

  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def valid?
    return false if sides.include?(0)

    a, b, c = sides.sort
    a + b > c
  end

  public

  def equilateral?
    valid? && sides.uniq.length == 1
  end

  def isosceles?
    valid? && sides.uniq.length <= 2
  end

  def scalene?
    valid? && sides.uniq.length == 3
  end
end
