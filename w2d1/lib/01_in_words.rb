class Fixnum
	def in_words
		translate = {
			0 => "zero",
			1 => "one",
			2 => "two",
			3 => "three",
			4 => "four",
			5 => "five",
			6 => "six",
			7 => "seven",
			8 => "eight",
			9 => "nine",
			10 => "ten",
			11 => "eleven",
			12 => "twelve",
			13 => "thirteen",
			14 => "fourteen",
			15 => "fifteen",
			16 => "sixteen",
			17 => "seventeen",
			18 => "eighteen",
			19 => "nineteen",
			20 => "twenty",
			30 => "thirty",
			40 => "forty",
			50 => "fifty",
			60 => "sixty",
			70 => "seventy",
			80 => "eighty",
			90 => "ninety"
		}
		num = self
		if translate.has_key?(num)
			translate[num]
		elsif num < 100
			"#{translate[(num/10)*10]} #{translate[num % 10]}"
		elsif num < 1000
			if num % 100 != 0
				"#{(num / 100).in_words} hundred #{(num % 100).in_words}"
			else
				"#{(num / 100).in_words} hundred"
			end
		elsif num < 1000000
			if num % 100 != 0
				"#{(num / 1000).in_words} thousand #{(num % 1000).in_words}"
			else
				"#{(num / 1000).in_words} thousand"
			end
		elsif num < 1000000000
			if num % 100 != 0
				"#{(num / 1000000).in_words} million #{(num % 1000000).in_words}"
			else
				"#{(num / 1000000).in_words} million"
			end
		elsif num < 1000000000000
			if num % 100 != 0
				"#{(num / 1000000000).in_words} billion #{(num % 1000000000).in_words}"
			else
				"#{(num / 1000000000).in_words} billion"
			end
		elsif num < 1000000000000000
			if num % 100 != 0
				"#{(num / 1000000000000).in_words} trillion #{(num % 1000000000000).in_words}"
			else
				"#{(num / 1000000000000).in_words} trillion"
			end
		else
			"number too large"
		end
	end
end