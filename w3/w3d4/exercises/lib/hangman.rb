class Hangman
  attr_reader :guesser, :referee, :board
  def initialize(players)
  	@guesser = players[:guesser]
  	@referee = players[:referee]
  end
  def setup
  	@board = [nil] * @referee.pick_secret_word
  	@guesser.register_secret_length(@board.length)
  end
  def take_turn
  	letter = @guesser.guess
  	result = @referee.check_guess(letter)
  	self.update_board(letter, result)
  	@guesser.handle_response(letter, result)

  end
  def update_board(letter, result)
  	for i in 0..result.length-1
  		@board[result[i]] = letter
  	end
  end

end

class HumanPlayer
	def guess
		puts "enter a letter."
		gets.chomp
	end
end

class ComputerPlayer
	def candidate_words
		@dictionary
	end
	def guess(board)
		letters = @dictionary.join
		letters_to_delete = excluded_letters(board)
		for i in 0..letters_to_delete.length-1
			letters.delete!(letters_to_delete[i])
		end

		most_common_letter(letters)
	end
	def handle_response(letter, result)
		i = 0
			while(@dictionary[i] != nil)
				if (!@dictionary[i].include?(letter) || result != multi_value_index(letter, @dictionary[i])) && result != []
					@dictionary.delete_at(i)
					i-=1
				elsif @dictionary[i].include?(letter) && result == []
					@dictionary.delete_at(i)
					i-=1
				end
				i+=1
			end

		if result == []
			puts "you guessed #{letter} and it was incorrect."
		else
			puts "you guessed #{letter} and it was correct."
		end
	end
	def register_secret_length(length)
		i=0
		while (@dictionary[i] != nil)
			if @dictionary[i].length != length
				@dictionary.delete_at(i)
				i-=1
			end
			i+=1
		end
		@secret_length = length
	end
	def initialize(dictionary)
		@dictionary = dictionary
	end
	def pick_secret_word
		@secret_word = @dictionary[rand(0..@dictionary.length-1)]
		@secret_word.length
	end

	def check_guess(letter)
		result = []
		for i in 0..@secret_word.length-1
			if letter == @secret_word[i]
				result << i
			end
		end
		result
	end
	private
	def multi_value_index(letter, word)
		result = []
		for i in 0..word.length-1
			if word[i] == letter
				result << i
			end
		end
		result
	end
	def most_common_letter(string)
		hash = Hash.new(0)
		string.split('').each{ |chr| hash[chr] += 1 }
		hash.key(hash.values.max)
	end
	def excluded_letters(board)
		result = []
		for i in 0..board.length-1
			if board[i] != nil && !result.include?(board[i])
				result << board[i]
			end
		end
		result
	end

end
