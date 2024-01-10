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
    @rolls = [0, 0]
    @frame = 0
    @turn = 0
  end

  def next_frame
    @turn = 0
    @frame += 1
  end

  def next_turn
    @turn += 1
    if @turn == 10
      @rolls << 0
    end
    @turn
  end

  def roll(pins)
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
