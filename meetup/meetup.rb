require "date"

class Meetup
  COMPLETE_WEEK = 7
  NEXT_WEEK_START = 8

  ORDINAL_WEEK_TO_INDEX = {
    :first => 0,
    :second => 7,
    :third => 14,
    :fourth => 21,
    :last => 24,
    :teenth => 12
  }.freeze

  DAY_TO_CARDINAL = {
    :Sunday => 0,
    :Monday => 1,
    :Tuesday => 2,
    :Wednesday => 3,
    :Thursday => 4,
    :Friday => 5,
    :Saturday => 6
  }.freeze

  private

  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  public

  def day(day, week)
    date = Date.new(year, month) + ORDINAL_WEEK_TO_INDEX[week]

    if DAY_TO_CARDINAL[day.capitalize] < date.wday
      date += NEXT_WEEK_START - date.wday
    end

    if day.capitalize.to_s != date.strftime("%A")
      date += DAY_TO_CARDINAL[day.capitalize] - date.wday
    end

    if date.month != month
      date -= COMPLETE_WEEK
    end

    date
  end
end
