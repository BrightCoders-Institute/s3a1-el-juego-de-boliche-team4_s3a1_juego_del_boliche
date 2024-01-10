# frozen_string_literal: false

require 'minitest/autorun'
require_relative '../src/frame'
require_relative '../src/score'

class TestFrame < Minitest::Test
  def test_is_spare
    obj_frame = Frame.new
    obj_score = Score.new(obj_frame)

    obj_frame.roll(3)
    obj_frame.next_turn
    obj_frame.roll(7)

    assert_equal(true, obj_frame.is_strike_or_spare)
  end

  def test_is_strike
    obj_frame = Frame.new
    obj_score = Score.new(obj_frame)

    obj_frame.roll(10)

    assert_equal(true, obj_frame.is_strike_or_spare)
  end

  def test_calc_score_regular_shot
    obj_frame = Frame.new
    obj_score = Score.new(obj_frame)

    obj_frame.roll(3)
    obj_frame.next_turn
    obj_frame.roll(4)

    assert_equal(7, obj_score.calculate_score)
  end

  def test_calc_score_spare
    obj_frame = Frame.new
    obj_score = Score.new(obj_frame)

    obj_frame.roll(3)
    obj_frame.next_turn
    obj_frame.roll(7)
    obj_frame.next_frame
    obj_frame.roll(4)

    assert_equal(14, obj_score.calculate_score)
  end
end
