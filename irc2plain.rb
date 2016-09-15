#!/usr/bin/env ruby

def xchat line
  m = line.match(/... .. ..:..:.. <(.*?)>\s+(.*)\s*/)
  m && [m[1], m[2]]
end

def irssi line
  m = line.match(/..:.. <[ @+](.*?)>\s+(.*)\s*/)
  m && [m[1], m[2]]
end

STDIN.each_line.lazy.
  map { |line| xchat(line) || irssi(line) }.
  reject(&:nil?).
  each { |stuff| puts stuff.join(" ") }
