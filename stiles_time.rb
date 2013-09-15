#!/bin/env ruby
# =Timestamp
# This class converts a String representing a date in RFC2822 format to
# a Time object and calculate the difference between two such timestamps.
# ==Usage:
# <tt>Timestamp.difference(time1, time2)</tt>
# * Receives two timestamps as Strings in RFC2822 format
# * Returns the number of minutes between them.
require 'time'

class Timestamp
  # An instance of <tt>::Time</tt>
  attr_reader :timestamp
  
  # Calculate the difference between two +Timestamp+ objects.
  # The result is returned as a positive integer number of minutes.
  # +time1+:: A +String+ object representing the first timestamp
  # +time2+:: A +String+ object representing the second timestamp
  def self.difference(time1, time2)
    t1 = Timestamp.new(time1)
    t2 = Timestamp.new(time2)
    difference = t1.difference_in_minutes(t2)
    return difference.abs
  end
  
  # Store the timestamp as a <tt>::Time</tt> object.
  # <tt>::Time.parse</tt> takes into account the timezone.
  # +timestamp+:: A +String+ object representing a date in the _RFC2822_ format
  def initialize(timestamp)
    @timestamp = ::Time.parse(timestamp)
  end

  # Calculate the difference between this object and another +Timestamp+ object.
  # The result is a rounded down number of minutes.
  # +other+:: The other +Timestamp+ object for comparison
  def difference_in_minutes(other)
    seconds = self.timestamp - other.timestamp
    return seconds_to_minutes(seconds)
  end
  
  private
    # Convert seconds to minutes. The result is rounded down.
    # +seconds+:: A +Fixnum+ or a +Float+ representing the number of seconds to be converted
    def seconds_to_minutes(seconds)
      minutes = seconds / 60
      return minutes.truncate
    end
end
