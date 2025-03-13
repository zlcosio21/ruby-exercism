class Tournament
  def self.tally(input)
    new(input).to_s
  end

  private

  attr_reader :input

  def initialize(input)
    @input = input.split("\n")
  end

  def team_stats
    stats = {}

    (input).each do |match|
      match = match.split(";")
      first_team, second_team, marcador = match

      [first_team, second_team].each do |team|
        stats[team] ||= { "MP" => 0, "W" => 0, "D" => 0, "L" => 0, "P" => 0 }
        stats[team]["MP"] += 1
      end

      case marcador
      when "win"
        stats[first_team]["W"] += 1
        stats[first_team]["P"] += 3
        stats[second_team]["L"] += 1
      when "draw"
        [first_team, second_team].each do |team|
          stats[team]["D"] += 1
          stats[team]["P"] += 1
        end
      when "loss"
        stats[second_team]["W"] += 1
        stats[second_team]["P"] += 3
        stats[first_team]["L"] += 1
      end
    end

    stats.sort_by { |team, data| [-data["P"], team] }
  end

  def leaderboard_table
    table = "Team                           | MP |  W |  D |  L |  P\n"

    team_stats.each do |team, stats|
      table << format(
        "%-31s| %2d | %2d | %2d | %2d | %2d\n",
        team, stats["MP"], stats["W"], stats["D"], stats["L"], stats["P"]
      )
    end

    table
  end

  public

  def to_s
    leaderboard_table
  end
end
