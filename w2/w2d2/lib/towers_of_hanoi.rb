# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp/) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
	attr_reader :first, :second, :third, :towers
	def initialize
		@first = [3, 2, 1]
		@second = []
		@third = []
		@towers = [@first, @second, @third]
	end
	def move(from_tower, to_tower)
		case(from_tower)
		when 0
			disc = @first.pop
		when 1
			disc = @second.pop 
		when 2
			disc = @third.pop 
		else
			puts "only 3 towers"
		end

		case(to_tower)
		when 0
			@first << disc
		when 1
			@second << disc
		when 2
			@third << disc
		else
			puts "only 3 towers"
		end
	end	
	def valid_move?(from_tower, to_tower)
		case(from_tower)
		when 0
			tower1 = @first
		when 1
			tower1 = @second
		when 2
			tower1 = @third
		else
			puts "only 3 towers"
		end

		case(to_tower)
		when 0
			tower2 = @first
		when 1
			tower2 = @second
		when 2
			tower2 = @third
		else
			puts "only 3 towers"
		end

		if tower1.empty?
			false
		elsif !tower2.empty? && tower1[tower1.length-1] > tower2[tower2.length-1]
			false
		else
			true
		end
	end
	def won?
		if @second == [3, 2, 1] || @third == [3, 2, 1]
			true
		else
			false
		end
	end
end
