
class Temperature
	def initialize(options={})
		@options = options
	end
	def in_fahrenheit
		if @options[:f] != nil
			@options[:f]
		else
			@options[:c]*9.0/5.0 + 32
		end
	end
	def in_celsius
		if @options[:c] != nil
			@options[:c]
		else
			5.0/9.0*(@options[:f]-32)
		end
	end
	def self.from_celsius(temp)
		Temperature.new(:c => temp)
	end
	def self.from_fahrenheit(temp)
		Temperature.new(:f => temp)
	end
end

	

class Celsius < Temperature
	def initialize(degrees)
		@options = {:c => degrees}
	end
end

class Fahrenheit < Temperature
	def initialize(degrees)
		@options = {:f => degrees}
	end
end

