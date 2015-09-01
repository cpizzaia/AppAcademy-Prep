class Code
  attr_reader :pegs
  PEGS = {
  	"B" => :blue,
    "G" => :green,
    "O" => :orange,
    "P" => :purple,
    "R" => :red,
    "Y" => :yellow
  }
  def self.parse(string)
  	pegs = []
  	string.upcase!
  	for i in 0..string.length-1
  		raise error unless PEGS.has_key?(string[i])
  		pegs << PEGS[string[i]]
  	end
  	Code.new(pegs)
  end
  def initialize(pegs)
  	@pegs = pegs
  end
  def self.random
  	letters = ["B", "G", "O", "P", "R", "Y"]
  	pegs = ""
  	4.times do
  		pegs << letters[rand(0..letters.length-1)]	
  	end
  	Code.new(pegs)
  end
  def [](i)
    @pegs[i]
  end
  def exact_matches(color_code)
  	matches = 0
  	for i in 0..3
  		if self[i] == color_code[i]
  			matches += 1
  		end
  	end
  	matches
  end
  def near_matches(color_code)
  	color_code_hash = color_code.convert_to_hash
  	self_hash = self.convert_to_hash
  	self_keys = self_hash.keys
  	near_matches = 0
  	for i in 0..self_keys.length-1
  		if color_code_hash.has_key?(self_keys[i])
  			near_matches += [color_code_hash[self_keys[i]], self_hash[self_keys[i]]].min
  		end
  	end
  	near_matches -self.exact_matches(color_code)

  end
  def convert_to_hash
  	result = Hash.new(0)
  	for i in 0..3
  		result[self[i]] += 1
  	end
  	result
  end
  def ==(color_code)
  	color_code.is_a?(Code) && self.exact_matches(color_code) == 4
  end



end


class Game
  attr_reader :secret_code
  def initialize(code=Code.random)
  	@secret_code = code
  end
  def get_guess
  	puts "Guess the color code."
  	begin
  		Code.parse(gets.chomp)
  	rescue
  		puts "You entered something wrong"
  		retry
  	end

  end
  def display_matches(code)
  	puts "near matches: #{code.near_matches(secret_code)}"
  	puts "exact matches: #{code.near_matches(secret_code)}"
  end
end
