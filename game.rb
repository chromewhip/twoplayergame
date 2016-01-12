require "pry"
require "colorize"
@turn = 0
@player1_score = 0
@player2_score = 0
@player1_lives = 3
@player2_lives = 3

# repl_bool = true

# def random_operator
#  operator = ['+', '-', '*', '/']
#  index = rand(4)
#  p operator[index]
# end
class NoNameError < StandardError
end
class InvalidGuessError < StandardError
end
def get_answer
  begin
  @user_input = gets.chomp.to_i
  !raise InvalidGuessError if @user_input.is_a?(Integer) 
  end
  rescue
end



def math_question
  @first_number = rand(1..20)
  @second_number = rand(1..20)
  @operator = rand(1..3)
  case @operator
  when 1
    @answer = @first_number + @second_number
    @operator_string = '+'
  when 2
    @answer = @first_number - @second_number
    @operator_string = '-'
  else
    @answer = @first_number * @second_number
    @operator_string = '*'
  end
  puts "what is #{@first_number} #{@operator_string} #{@second_number}?"
  get_answer
end

def lives_score
  case 
  when @turn == 0 && @user_input == @answer
    @player1_score += 1
    puts"#{@player1} score +1".colorize(:green)
  when @turn == 1 && @user_input == @answer
    @player2_score += 1
    puts "#{@player2} score +1".colorize(:green)
  when @turn == 0 && @user_input != @answer
    @player1_lives -= 1
    puts "#{@player1} lives -1".colorize(:red)
  when @turn == 1 && @user_input != @answer
    @player2_lives -= 1
    puts "#{@player2} lives -1".colorize(:red)
  end
end


def player1_name
  begin
    puts "what is player 1's name:"
    @player1 = gets.chomp.colorize(:blue)
    raise NoNameError if @player1.empty?
  end
rescue
retry
end

def player2_name
  begin
  puts "what is player 2's name:"
  @player2 = gets.chomp.colorize(:orange)
  raise NoNameError if @player2.empty?
end
rescue
retry
end

def score_count
  puts "THE SCORE SO FAR IS:"
  puts "#{@player1}: #{@player1_score}" "CORRECT ANSWERS".colorize(:green)
  puts " #{@player1_lives} LIVES".colorize(:red) 
  puts "#{@player2}: #{@player2_score} CORRECT ANSWERS".colorize(:green)
   puts " #{@player2_lives} LIVES".colorize(:red)
end

def game_over
  if @player1_lives <= 0 || @player2_lives <= 0
    puts "GAME OVER"
    if @player2_lives > @player1_lives 
      puts "#{@player2} is the winner!"
    else
      puts "#{@player1} is the winner!"
    end
    puts "do you want to play again?(yes or no)"
    input = gets.chomp
    case input
      when "no"
        return true
      when "yes"
        @turn = 0
        @player1_score = 0
        @player2_score = 0
        @player1_lives = 3
        @player2_lives = 3
      return false
    else
      true
    end
  end
end

player1_name
player2_name
while !game_over
  math_question
  get_answer
  lives_score
  case @turn
    when 0
    @turn += 1
    score_count
    when 1
      @turn -= 1
      score_count
  end
end