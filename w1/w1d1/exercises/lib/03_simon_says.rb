def echo(text)
	text
end

def shout(text)
	text.upcase
end

def repeat(text, num=2)
	result = []
	for i in 1..num
		result << text
	end
	result.join(" ")
end

def start_of_word(word, letters)
	result = []
	for i in 0..letters-1
		result << word[i]
	end
	result.join("")
end

def first_word(sentence)
	result = []
	result = sentence.split(" ")
	result[0]
end

def titleize(title)
	proper_title = []
	title = title.split(" ")
	for i in 0..title.length-1
		if title[i] != "a" && title[i] != "an" && title[i] != "the" && title[i] != "and" && title[i] != "over" || i==0
			proper_title[i] = title[i].capitalize
		else
			proper_title[i] = title[i]
		end
	end
	proper_title.join(" ")
end



