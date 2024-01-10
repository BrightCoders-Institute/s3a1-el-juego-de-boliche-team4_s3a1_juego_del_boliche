# frozen_string_literal: false
require_relative 'frame'

# Score class
class Score < Frame
  attr_accessor :matrix

  def initialize
    super()
    @matrix = Array.new(9) { Array.new(3, 0) }
    @matrix.push(Array.new(4, 0))
  end

  def finish_rolls
    @matrix[frame][0] = rolls[0]
    @matrix[frame][1] = rolls[1]
  end

  def calculate_score
    @matrix[frame][2] = @matrix[frame][0] + @matrix[frame][1]
  end

  def calculate_score_spare
    @matrix[frame - 1][2] = (@matrix[frame - 1][0] + @matrix[frame - 1][1]) + @matrix[frame][0]
  end

  def calculate_score_strike(option = FALSE)
    if option == TRUE # double strike
      additional = @matrix[frame - 1][0] + @matrix[frame][0]
      @matrix[frame - 2][2] = @matrix[frame - 2][0] + @matrix[frame - 2][1] + additional
    else
      additional = @matrix[frame][0] + @matrix[frame][1]
      @matrix[frame - 1][2] = @matrix[frame - 1][0] + @matrix[frame - 1][1] + additional
    end
  end
end
