class HumanPlayer
	attr_reader :name
	attr_accessor :mark
	def initialize(name)
		@name = name
	end
	def get_move
    	puts "Where would you like to move? (row, col)"
    	gets.chomp.split(", ").map(&:to_i)
  	end
  	def display(board)
  		for i in 0..board.grid.length-1
  			for j in 0..board.grid[i].length-1
  				if j != board.grid[i].length-1
	  				if board.mark([i, j]) == :X
	  					print " X |"
	  				elsif board.mark([i, j]) == :O
	  					print " O |"
	  				else
	  					puts "   |"
	  				end
	  			else
	  				if board.mark([i, j]) == :X
	  					puts " X "
	  				elsif board.mark([i, j]) == :O
	  					puts " O "
	  				else
	  					puts "   "
	  				end
	  			end
	  		end
	  		if i != board.grid.length-1
	  			puts "------------"
	  		end
	  	end
  	end
end

