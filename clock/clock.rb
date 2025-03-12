class Clock
  HOUR_IN_MINUTES = 60
  DAY = 24

  attr_accessor :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute / HOUR_IN_MINUTES) % DAY
    @minute = minute % HOUR_IN_MINUTES
  end

  public

  def +(other)
    Clock.new(hour: hour + other.hour, minute: minute + other.minute)
  end

  def -(other)
    Clock.new(hour: hour - other.hour, minute: minute - other.minute)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def to_s
    format("%02d:%02d", hour, minute)
  end
end
