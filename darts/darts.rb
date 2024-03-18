class Darts
  BANDS_SCORE = {
    (0..1) => 10,
    (1..5) => 5,
    (5..10) => 1,
    (10..) => 0
  }

  attr_reader :score, :distance

  def initialize(x, y)
    @distance = Math.sqrt(x**2 + y**2)
  end

  def score
    BANDS_SCORE.detect do |distance_range, _|
      distance_range.include?(@distance)
    end.last
  end
end
