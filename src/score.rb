# frozen_string_literal: false
require 'matrix'

# Score class

class Score
  attr_accessor :Matrix

  def initialize(obj_frame)
    @obj_frame = obj_frame
    @index = obj_frame.frame
    @matrix = Matrix.build(11, 3) { 0 }
  end

  def calculate_score
    @matrix[@index][2] = @matrix[@index][0] + @matrix[@index][1]
  end

  def calculate_score_spare
    @matrix[@index - 1][2] = (@matrix[@index - 1][0] + @matrix[@index - 1][1]) + @matrix[@index][0]
  end

  def calculate_score_strike(option = FALSE)
    if option == TRUE # double strike
      additional = @matrix[@index - 1][0] + @matrix[@index][0]
      @matrix[@index - 2][2] = @matrix[@index - 2][0] + @matrix[@index - 2][1] + additional
    else
      additional = @matrix[@index][0] + @matrix[@index][1]
      @matrix[@index - 1][2] = @matrix[@index - 1][0] + @matrix[@index - 1][1] + additional
    end
  end
end
