def reverser
	yield.split(" ").map {|word| word.reverse}.join(" ")
end

def adder(num=1)
	yield + num
end

def repeater(repeat=1)
	repeat.times  do
		yield
	end
end