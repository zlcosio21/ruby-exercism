class AssemblyLine
  CARS_PER_HOUR = 221
  SUCCES_RATE = {
    (1..4) => 1.0,
    (5..8) => 0.9,
    (9..9) => 0.8,
    (10..10) => 0.77,
  }

  private

  attr_reader :speed

  def initialize(speed)
    @speed = speed
  end

  def success_rate
    SUCCES_RATE.detect { |speed_range, _| speed_range.include?(speed) }.last
  end

  public

  def production_rate_per_hour
    speed * CARS_PER_HOUR * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
