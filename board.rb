class Board
  attr_accessor :state

  def initialize
    @state = Array.new(3) { Array.new(3, ' ')}
  end

  def to_s
    string = ""
    @state.each_with_index do |row, row_index|
      row.each_with_index do |space, space_index|
        if space_index == 2
          string += "  #{space}\n"
        else
          string += "  #{space}  |" 
        end
      end
      if row_index != 2
        string += "-----------------\n"
      end
    end
    string
  end

  def valid_move?(row, column)
    @state.dig(row, column) == ' '
  end

  def full?
    @state.each do |row|
      return false if row.include?(' ')
    end
    return true
  end

  def win?
    # check for a horizontal win condition
    @state.each do |row|
      return true if row.eql?(['X', 'X', 'X']) || row.eql?(['O', 'O', 'O'])
    end

    # check for a vertical win condition
    @state.transpose.each do |row|
      return true if row.eql?(['X', 'X', 'X']) || row.eql?(['O', 'O', 'O'])
    end

    # check for a diagonal win condition
    return true if @state[0][0] == 'X' && @state[1][1] == 'X' && @state[2][2] == 'X'
    return true if @state[0][0] == 'O' && @state[1][1] == 'O' && @state[2][2] == 'O'
    return true if @state[0][2] == 'X' && @state[1][1] == 'X' && @state[2][0] == 'X'
    return true if @state[0][2] == 'O' && @state[1][1] == 'O' && @state[2][0] == 'O'

    # if none of the above win conditions have been met, no one has won yet
    return false
  end

  def game_over?(current_player)
    if self.win?
      puts "Congratulations, #{current_player.name}, you've won!"
      return false
    elsif self.full?
      puts "Sorry, looks like no one won this time. It's a draw!"
      return false
    end
    return true
  end

end 