class Dictionary
	attr_reader :entries
	def initialize
		@entries = {}
	end
	def add(new_addition)
		if new_addition.is_a? Hash
			@entries.merge! new_addition
		else
			@entries = {new_addition => nil}
		end

	end
	def keywords
		keys = []
		i=0
		@entries = @entries.sort_by {|key, value| key}
		@entries.each do |key, value|
			keys[i] = key
			i+=1
		end
		keys
	end
	def include?(word)
		@entries.each {|key, value| key == word ? (return true) : false}
		false
	end
	def find(word)
		@entries.select {|key, value| key.start_with? word}
	end
	def printable
		string = []
		@entries.sort.each {|key,value| string << "\[#{key}\] \"#{value}\"" }
		string.join("\n")
	end

end

def true.true?
  true
end

def true.false?
  false
end

def false.true?
  false
end

def false.false?
  true
end
