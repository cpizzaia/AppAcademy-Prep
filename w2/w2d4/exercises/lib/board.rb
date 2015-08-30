class Board
	attr_reader :grid, :marks
	def initialize(grid=[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
		@grid = grid
		@marks = [:X, :O]
	end
	def place_mark(pos, mark)
		@grid[pos[0]][pos[1]] = mark
	end
	def empty?(pos)
		@grid[pos[0]][pos[1]].nil?
	end
	def mark(pos)
		@grid[pos[0]][pos[1]]
	end
	def winner
		row = []
		column1 = []
		column2 = []
		column3 = []
		left_diag = []
		right_diag = []
		x = [:X, :X, :X]
		o = [:O, :O, :O]
		for i in 0..@grid.length-1
			row = @grid[i]
			left_diag << @grid[i][i]
			right_diag << @grid[2-i][i]
			column1 << row[0]
			column2 << row[1]
			column3 << row[2]
			if row == x || right_diag == x ||left_diag == x || column1 == x || column2 == x || column3 == x
				return :X
			elsif row == o || right_diag == o || left_diag == o || column1 == o || column2 == o || column3 == o
				return :O
			end
		end
		nil
	end
	def over?
		if !self.winner.nil?
			true
		else
			for i in 0..@grid.length-1
				for j in 0.. @grid.length-1
					if @grid[i][j].nil?
						return false
					end
				end
			end
			true
		end
	end
end

