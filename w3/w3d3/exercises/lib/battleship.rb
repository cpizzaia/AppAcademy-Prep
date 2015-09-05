class BattleshipGame
  attr_reader :board, :player
  def initialize(player, board)
  	@player = player
  	@board = board
  end
  def attack(position)
  	@board.mark(position, :x)
  end
  def count
  	@board.count
  end
  def game_over?
  	@board.won?
  end
  def play_turn
  	position = @player.get_play
  	self.attack(position)
  end
end
