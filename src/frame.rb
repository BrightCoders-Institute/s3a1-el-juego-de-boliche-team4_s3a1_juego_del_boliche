# frozen_string_literal: false
class Frame
  attr_accessor :rolls, :frame, :turn

  def initialize
    @rolls = [0, 0]
    @frame = 0
    @turn = 0
  end

  def next_frame
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

  def print_frame
    if is_strike
      '■'
    elsif is_spare
      "#{@rolls[0]}└#{@rolls[1]}"
    else
      @rolls.join(' ')
    end
  end
end
