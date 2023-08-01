require './player.rb'
require './board.rb'

class Game
  def initialize
    puts "Welcome to console tic-tac-toe! Let's play a game!"
    puts "Player One: What is your name?"
    player_one_name = gets.chomp
    puts "Player Two: What is your name?"
    player_two_name = gets.chomp
    puts "#{player_one_name}: Would you like to play as 'X' or 'O'?"
    @player_one, @player_two = create_players(player_one_name, player_two_name)

    @board = Board.new
  end

  def create_players(player_one_name, player_two_name)
    marker = gets.chomp
    if marker == 'X'
      player_one = Player.new(player_one_name, 'X')
      player_two = Player.new(player_two_name, 'O')
    elsif marker == 'O'
      player_one = Player.new(player_one_name, 'O')
      player_two = Player.new(player_two_name, 'X')
    else
      puts "That's not a valid marker. Please try again."
      get_marker
    end
    return player_one, player_two
  end 

  def play_round(player, board)
    row, column = player.move
    until board.valid_move?(row, column)
      puts "That's not a valid move. Please try again."
      row, column = player.move
    end
    board.state[row][column] = player.marker
    board.game_over?(player)
  end

  def play
    puts "Great! #{@player_one.name} will be #{@player_one.marker}, and #{@player_two.name} will be #{@player_two.marker}.\n\n"
    puts "Let's get to the game!\nOn your turn, you can place your marker by specifying the row and then the column where you would like to go."
    puts @board
    game_active = true
    round = 1
    while game_active == true
      if round.odd?
        game_active = play_round(@player_one, @board)
      else
        game_active = play_round(@player_two, @board)
      end
      puts @board
      round += 1
    end
  end
end

Game.new.play