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
    @rolls = [0, 0, 0]
    @frame += 1 if @frame < 10
  end

  def next_turn_last_frame
    @turn = if strike? || spare?
              @turn.zero? ? 1 : 2
            else
              @turn.zero? ? 1 : 0
            end
  end

  def next_turn
    if @frame == 9
      next_turn_last_frame
    else
      @turn = if strike?
                0
              else
                @turn.zero? ? 1 : 0
              end
    end
  end

  def play_roll(pins)
    @rolls[@turn] = pins
  end

  def strike?
    @rolls[@turn] == 10
  end

  def spare?
    @rolls[0] + @rolls[1] == 10
  end
end
