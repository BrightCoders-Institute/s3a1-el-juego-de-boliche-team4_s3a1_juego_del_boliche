# frozen_string_literal: false

# Frame class
# This class is used to store the rolls of a frame
# and to check if the frame is a strike or spare
# @rolls: rolls of the frame
# @frame: current frame
# @turn: current rolls of the frame
class Frame
  attr_accessor :rolls, :frame, :turn

  def initialize
    @rolls = [0, 0, 0]
    @frame = 0
    @turn = 0
  end

  def next_frame
    @frame += 1 if @turn == 1 && @frame < 10
    next_turn
  end

  def next_turn
    if @frame == 10
      @turn = @turn.zero? ? 1 : 2
    end
    @turn = @turn.zero? ? 1 : 0
  end

  def play_roll(pins)
    @rolls[@turn] = pins
  end

  def is_strike_or_spare
    if @turn == 0
      return @rolls[@turn] == 10
    else
      return @rolls[@turn - 1] + @rolls[@turn] == 10
    end
  end
end
