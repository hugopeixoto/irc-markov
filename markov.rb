#!/usr/bin/env ruby

ORDER=2

def generate_phrase words
  phrase = words.keys.sample

  while phrase.last != '.' && phrase.size < 50
    phrase << words[phrase.last(ORDER)].sample
  end

  phrase[1...-1]
end

words = Hash.new { |h,k| h[k] = [] }

STDIN.each_line.lazy.
  map { |x| x.split }.
  each { |w| words[w.first(ORDER)] << w.last }

50.times {
  puts generate_phrase(words).join(" ")
}
