class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def move
    puts "#{@name}, you're up. In which row would you like to place an #{@marker}?"
    row = gets.chomp.to_i - 1
    until row >= 0 && row <= 3
      puts "That's not a valid row number. Please try again."
      row = gets.chomp.to_i - 1
    end
    puts "Nice! In which column within that row would you like to place an #{@marker}?"
    column = gets.chomp.to_i - 1
    until column >= 0 && column <= 3
      puts "That's not a valid column number. Please try again."
      column = gets.chomp.to_i - 1
    end
    return row, column
  end
end