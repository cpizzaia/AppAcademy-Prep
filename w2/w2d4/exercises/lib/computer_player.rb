class ComputerPlayer
	attr_reader :name, :board
	attr_writer :mark
	def initialize(name)
		@name = name
	end
	def display(board)
		@board = board
	end
	def get_move
		for i in 0..2
			for j in 0..2
				if @board.empty?([i, j])
					@board.place_mark([i, j], @mark)
					if @board.winner == @mark
						@board.place_mark([i, j], nil)
						return [i, j]
					else
						@board.place_mark([i, j], nil)
					end
				end
			end
		end
		self.board.place_mark([rand(0..2), rand(0..2)], @mark)
	end
end
