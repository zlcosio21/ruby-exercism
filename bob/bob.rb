class Bob
  def self.hey(phrase)
    phrase = Phrase.new(phrase)

    if phrase.empty?
      "Fine. Be that way!"
    elsif phrase.yell? && phrase.ask?
      "Calm down, I know what I'm doing!"
    elsif phrase.yell?
      "Whoa, chill out!"
    elsif phrase.ask?
      "Sure."
    else
      "Whatever."
    end
  end
end

class Phrase
  def initialize(phrase)
    @phrase = phrase.strip
  end

  def empty?
    @phrase.empty?
  end

  def ask?
    @phrase.end_with?("?")
  end

  def yell?
    @phrase == @phrase.upcase && @phrase.match?(/[[:alpha:]]/)
  end
end
