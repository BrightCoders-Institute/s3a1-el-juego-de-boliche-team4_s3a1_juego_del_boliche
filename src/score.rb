# frozen_string_literal: false
class Score
  attr_accessor :score, :frame, :lastframe

  # Constructor needs the rolls array from Frame class
  # new Puntuacion(@rolls)
  def initialize(frame)
    @frame = frame
    @score = 0
  end

  def calculate_score
    if @frame.is_strike_or_spare
      @lastframe = @frame.rolls
    else
      @score = @frame.rolls.sum
    end
  end
end
