class TwelveDays
  DAYS = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

  VERSES = [
    "a Partridge in a Pear Tree.",
    "two Turtle Doves, and",
    "three French Hens,",
    "four Calling Birds,",
    "five Gold Rings,",
    "six Geese-a-Laying,",
    "seven Swans-a-Swimming,",
    "eight Maids-a-Milking,",
    "nine Ladies Dancing,",
    "ten Lords-a-Leaping,",
    "eleven Pipers Piping,",
    "twelve Drummers Drumming,"
  ]

  def self.single_verse(day)
    VERSES[DAYS.index(day)]
  end

  def self.song
    lyrics = ""
    all_verses = []

    DAYS.each do |day|
      all_verses << single_verse(day)
      lyrics << "On the #{day} day of Christmas my true love gave to me: #{all_verses.reverse.join(" ")}\n\n"
    end

    lyrics.chop!
  end
end
