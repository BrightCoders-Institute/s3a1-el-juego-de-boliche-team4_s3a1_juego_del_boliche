# frozen_string_literal: false

require_relative 'frame'

# Score class
class Score < Frame
  attr_accessor :matrix, :score, :count

  def initialize
    super()
    @score = 0
    @matrix = Array.new(9) { Array.new(3, 0) }
    @matrix.push(Array.new(4, 0))
  end

  def finish_rolls
    @matrix[frame][0] = rolls[0]
    @matrix[frame][1] = rolls[1]
    @matrix[frame][2] = rolls[2] if frame == 9
  end

  def calculate_score
    @score += @matrix[frame][0] + @matrix[frame][1]
    @matrix[frame][2] = @score
  end

  def calculate_score_spare
    @score += @matrix[frame - 1][0] + @matrix[frame - 1][1] + @matrix[frame][0]
    @matrix[frame - 1][2] = @score
  end

  def calculate_score_strike(option = false)
    if option == true # double strike
      additional = @matrix[frame - 1][0] + @matrix[frame][0]
      @score += @matrix[frame - 2][0] + @matrix[frame - 2][1] + additional
      @matrix[frame - 2][2] = @score
    else
      additional = @matrix[frame][0] + @matrix[frame][1]
      @score += @matrix[frame - 1][0] + @matrix[frame - 1][1] + additional
      @matrix[frame - 1][2] = @score
    end
  end

  def calculate_score_last_frame
    if strike? || spare?
      @score += @matrix[frame][0] + @matrix[frame][1] + @matrix[frame][2]
      @matrix[frame][3] = @score
    else
      calculate_score
    end
  end
end
