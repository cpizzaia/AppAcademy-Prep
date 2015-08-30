require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
	attr_reader :board, :current_player
	def initialize(player_one, player_two)
		@player_one = player_one
		@player_two = player_two
	    player_one.mark = :X
	    player_two.mark = :O
	    @current_player = @player_one
	    @board = Board.new
	end
	def play_turn
		board.place_mark(@current_player.get_move,  @current_player.mark)
		self.switch_players!
	end

	def switch_players!
		if @current_player == @player_one
			@current_player = @player_two
		else
			@current_player = @player_one
		end
	end
end
