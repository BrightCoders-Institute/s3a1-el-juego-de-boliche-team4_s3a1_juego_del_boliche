# frozen_string_literal: false

require_relative 'score'

# def strike?(obj_score)
#   if obj_score.strike?
#     obj_score.finish_rolls
#     obj_score.calculate_score
#     obj_score.next_frame
#     puts 'strike'
#     1
#   else
#     puts 'no strike'
#     0
#   end
# end

# def spare?(obj_score)
#   if obj_score.spare?
#     obj_score.finish_rolls
#     obj_score.calculate_score
#     obj_score.next_frame
#     puts 'spare'
#     1
#   else
#     puts 'no spare'
#     0
#   end
# end

# def play_frame(obj_score, play1, play2 = 0)
#   obj_score.play_roll(play1)
#   obj_score.next_turn
#   1 if strike?(obj_score) == 1

#   obj_score.play_roll(play2)
#   obj_score.next_turn
#   2 if spare?(obj_score) == 1

#   obj_score.calculate_score

#   obj_score.finish_rolls
#   obj_score.next_frame
#   3
# end

# obj_score = Score.new

# r1 = play_frame(obj_score, 10, 0)

# # obj_score.calculate_score
# # print obj_score.matrix

# r2 = play_frame(obj_score, 10, 0)
# # obj_score.calculate_score

# r3 = play_frame(obj_score, 8, 2)
# # obj_score.calculate_score

# puts "r1: #{r1}, r2: #{r2}, r3: #{r3}"
# obj_score.calculate_score_strike(true)
# print obj_score.matrix

def print_special_frame(roll1, roll2, roll3 = nil)
  if !roll3.nil?
    if roll1 == 10
      " ▅ └ #{roll3}"
    elsif roll1 + roll2 == 10
      "#{roll1} ◪ └ #{roll3}"
    else
      "#{roll1} └ #{roll2} └ #{roll3}"
    end
  elsif roll1 + roll2 == 10
    "#{roll1}   ◪"
  elsif roll1 == 10
    '    ▅'
  else
    "#{roll1} └ #{roll2}"
  end
end

def print_table(frame, matrix)
  table = Array.new()
  table.push(['Frame', 'Rolls', 'Score'])
  frame.times do |i|
    score = matrix[i][2].zero? ? '' : matrix[i][2].to_s
    score = matrix[i][3].to_s if i == 9
    rolls = print_special_frame(matrix[i][0], matrix[i][1], matrix[i][2])
    rolls = print_special_frame(matrix[i][0], matrix[i][1]) if i < 9
    table.push([(i + 1).to_s, rolls, score])
  end

  # Determine the maximum length of each column
  max_lengths = table.transpose.map do |col|
    col.map { |item| item.to_s.length }.max
  end

  # Print the top border
  puts '-' * (max_lengths.sum + max_lengths.size * 3)

  # Print the data
  table.each do |row|
    row.each_with_index do |item, index|
      printf("| %#{max_lengths[index]}s ", item)
    end
    puts '|'
  end

  # Print the bottom border
  puts '-' * (max_lengths.sum + max_lengths.size * 3)
end

obj_score = Score.new

# frame 1
obj_score.play_roll(10)
obj_score.next_turn
obj_score.finish_rolls

# frame 2
obj_score.next_frame
obj_score.play_roll(10)
obj_score.next_turn
obj_score.finish_rolls

# frame 3
obj_score.next_frame
obj_score.play_roll(4)
obj_score.next_turn
obj_score.play_roll(2)
obj_score.next_turn
obj_score.finish_rolls
obj_score.calculate_score_strike(true)
obj_score.calculate_score_strike
obj_score.calculate_score

# frame 4
obj_score.next_frame
obj_score.play_roll(3)
obj_score.next_turn
obj_score.play_roll(1)
obj_score.next_turn
obj_score.finish_rolls
obj_score.calculate_score

# frame 5
obj_score.next_frame
obj_score.play_roll(4)
obj_score.next_turn
obj_score.play_roll(6)
obj_score.next_turn
obj_score.finish_rolls

# frame 6
obj_score.next_frame
obj_score.play_roll(3)
obj_score.next_turn
obj_score.play_roll(1)
obj_score.next_turn
obj_score.finish_rolls
obj_score.calculate_score_spare
obj_score.calculate_score

# frame 7
obj_score.next_frame
obj_score.play_roll(10)
obj_score.next_turn
obj_score.finish_rolls

# frame 8
obj_score.next_frame
obj_score.play_roll(4)
obj_score.next_turn
obj_score.play_roll(2)
obj_score.next_turn
obj_score.finish_rolls
obj_score.calculate_score_strike
obj_score.calculate_score

# frame 9
obj_score.next_frame
obj_score.play_roll(3)
obj_score.next_turn
obj_score.play_roll(1)
obj_score.next_turn
obj_score.finish_rolls
obj_score.calculate_score

# frame 10
obj_score.next_frame
obj_score.play_roll(4)
obj_score.next_turn
obj_score.play_roll(6)
obj_score.next_turn
obj_score.play_roll(10)
obj_score.finish_rolls
obj_score.calculate_score_last_frame

print_table(obj_score.frame + 1, obj_score.matrix)
