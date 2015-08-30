# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.


def guessing_game
	number = rand(1..100)
	guesses = 0
	while(true)
		puts "Guess a number."
		user_input = gets.chomp
		puts "You guessed: #{user_input}."
    guesses += 1
		if user_input.to_i > number
			puts "You guessed too high."
		elsif user_input.to_i < number
			puts "You guessed too low."
		else
      puts "You correctly guessed the number #{number}"
			break
		end
	end
	puts "It took #{guesses} guesses"
end


if __FILE__ == $PROGRAM_NAME
  puts "Enter a file name."
  file_name = gets.chomp
  file_lines = []
  shuffled_file_name = "#{file_name[0..file_name.length-5]}-shuffled.txt"
  File.open(file_name) do |file|
    file_lines = file.readlines()
  end


  File.write(shuffled_file_name, "")
  File.open(shuffled_file_name, "w") do |file|
    file.puts(file_lines.shuffle!)
  end
end
