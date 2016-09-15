#!/usr/bin/env ruby

ORDER=2

def handle_periods text
  text.gsub(/\.+/, '')
end

def handle_urls text
  text.gsub(/http[^\s]*/, "<url>")
end


STDIN.each_line.lazy.
  flat_map { |text| handle_periods(handle_urls(text.strip)).downcase.split[1..-1].each_cons(ORDER+1).to_a }.
  each { |stuff| puts stuff.join(" ") }
