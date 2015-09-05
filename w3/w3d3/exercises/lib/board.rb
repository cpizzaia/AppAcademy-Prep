class Board
	attr_reader :grid
	def initialize(grid=self.class.default_grid)
		@grid = grid
	end
	def self.default_grid
		Array.new(10) {Array.new(10)}
	end
	def count
		count = 0
		flatten_grid = @grid.flatten
		for i in 0..flatten_grid.length-1
			if flatten_grid[i] == :s
				count += 1
			end
		end
		count
	end
	def mark(position, mark)
		@grid[position[0]][position[1]] = mark
	end
	def [](pos)
	    x, y = pos
	    grid[x][y]
	end

	def empty?(position=nil)
		if !position.nil?
			@grid[position[0]][position[1]].nil?
		elsif self.count > 0
			false
		else
			true
		end
	end
	def full?
		self.count == 4
	end
	def place_random_ship
		while(true)
			raise "error" if self.full?
			x = rand(0..@grid.length-1)
			y = rand(0..@grid.length-1)
			if self.empty?([x, y])
				@grid[x][y] = :s
				break
			end
		end
	end
	def won?
		self.empty?
	end
	
end
