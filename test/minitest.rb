# frozen_string_literal: false

require 'minitest/autorun'
require_relative '../src/score'

class TestFrame < Minitest::Test
  def test_is_spare
    obj_score = Score.new

    obj_score.play_roll(3)
    obj_score.next_turn
    obj_score.play_roll(7)

    assert_equal(true, obj_score.spare?)
  end

  def test_is_strike
    obj_score = Score.new

    obj_score.play_roll(10)

    assert_equal(true, obj_score.strike?)
  end

  def test_calc_score_regular_shot
    obj_score = Score.new

    obj_score.play_roll(3)
    obj_score.next_turn
    obj_score.play_roll(4)
    obj_score.finish_rolls

    assert_equal(7, obj_score.calculate_score)
  end

  def test_calc_score_spare
    obj_score = Score.new

    obj_score.play_roll(3)
    obj_score.next_turn
    obj_score.play_roll(7)
    obj_score.next_turn

    obj_score.finish_rolls

    obj_score.next_frame
    obj_score.play_roll(4)
    obj_score.next_turn
    obj_score.play_roll(2)
    obj_score.finish_rolls

    assert_equal(14, obj_score.calculate_score_spare)
  end

  def test_calc_score_strike_regular_shot
    obj_score = Score.new

    obj_score.play_roll(10)
    obj_score.next_turn
    obj_score.finish_rolls

    obj_score.next_frame
    obj_score.play_roll(4)
    obj_score.next_turn
    obj_score.play_roll(2)
    obj_score.finish_rolls

    assert_equal(16, obj_score.calculate_score_strike)
  end

  def test_calc_score_double_strike
    obj_score = Score.new

    obj_score.play_roll(10)
    obj_score.next_turn
    obj_score.finish_rolls

    obj_score.next_frame
    obj_score.play_roll(10)
    obj_score.next_turn
    obj_score.finish_rolls

    obj_score.next_frame
    obj_score.play_roll(4)
    obj_score.next_turn
    obj_score.play_roll(2)
    obj_score.next_turn
    obj_score.finish_rolls

    assert_equal(24, obj_score.calculate_score_strike(true))
  end
end
