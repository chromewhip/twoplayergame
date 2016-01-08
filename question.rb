class Question
  attr_reader(:answer)

  def initialize
    @first_num = rand(1..20)
    @second_num = rand(1..20)
    @operator = rand(1..3)

    case @operator
    when 1
      @answer = @first_num + @second_num
      @op_string = '+'
    when 2
      @answer = @first_num - @second_num
      @op_string = '-'
    else
      @answer = @first_num * @second_num
      @op_string = '*'
    end
  end

  def to_string
    "What is #{@first_num} #{@op_string} #{@second_num} ?!?! "
  end

  def is_correct?(user_input)
    if user_input == @answer
      return true
    else
      return false
    end
  end


end