# frozen_string_literal: true

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def move
    puts "\n\n#{@name}, you're up. In which row would you like to place an #{@marker}?"
    row = gets.chomp.to_i - 1
    puts "Nice! In which column within that row would you like to place an #{@marker}?"
    column = gets.chomp.to_i - 1
    [row, column]
  end
end
