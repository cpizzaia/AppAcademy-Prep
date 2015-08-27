class Book
  attr_accessor :title
	def title=(sentence)
		sentence = sentence.split(" ")
		excluded_words = ["and", "in", "the", "of", "a", "an"]
		sentence.map {|word| excluded_words.include?(word) ? word : word.capitalize!}	 
		sentence[0].capitalize!
		@title = sentence.join(" ")
	end
end
