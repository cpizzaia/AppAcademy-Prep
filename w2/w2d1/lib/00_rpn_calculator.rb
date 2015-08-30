class RPNCalculator
	def initialize
		@position = -1
		@numbers = []
	end
	def value
		@numbers[@position]
	end
	def push(num)
		@numbers << num
		@position += 1
	end
	def numbers_and_shift
		raise "calculator is empty" if @numbers.length <1
		@num1, @num2 = 0, 0
		@num1 = @numbers[@position]
		@position -= 1
		@num2 = @numbers[@position]
		@numbers.delete_at(@position+1)
	end
	def plus
		numbers_and_shift
		@numbers[@position] = @num1 + @num2
	end
	def minus
		numbers_and_shift
		@numbers[@position] = @num2 - @num1
	end
	def times
		numbers_and_shift
		@numbers[@position] = @num1.to_f * @num2.to_f
	end
	def divide
		numbers_and_shift
		@numbers[@position] = @num2.to_f / @num1.to_f
	end
	def tokens(input)
		input = input.split(" ")
		for i in 0..input.length-1
			case input[i]
			when "*"
				input[i] = :*
			when "/"
				input[i] = :/
			when "+"
				input[i] = :+
			when "-"
				input[i] = :-
			else
				input[i] = input[i].to_i
			end
		end
		input
	end
	def evaluate(input)
		input = input.split(" ")
		for i in 0..input.length-1
			case input[i]
			when "*"
				times
			when "/"
				divide
			when "+"
				plus
			when "-"
				minus
			else
				push(input[i].to_i)
			end
		end
		value
	end
end

if __FILE__ == $PROGRAM_NAME
	file_name = ARGV[0]
	Calculator = RPNCalculator.new
	if file_name != nil && File.exist?(file_name)
		idk = []
		file_lines = []
		File.open("calculator_instructions.txt") do |file|
			file_lines = file.readlines()
		end
		puts file_lines

		for i in 0..file_lines.length-1
			output << Calculator.evaluate(file_lines[i])
		end
		puts output
	else
		calculator_input = ""
		while(true)
			user_input = gets.chomp
			if user_input == ""
				break
			else
				calculator_input << "#{user_input} "
			end
		end
		puts Calculator.evaluate(calculator_input)
	end
end


