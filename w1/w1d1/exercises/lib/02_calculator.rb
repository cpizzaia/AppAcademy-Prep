def add(num1, num2)
	num1 + num2
end

def subtract(num1, num2)
	num1-num2
end

def sum(input_array)
	result = 0
	if input_array == []
		return 0
	end
	for i in 0..input_array.length-1
		result = input_array[i] + result
	end
	result
end

def multiply(num1, num2=1)
	result = 1
	if num1 == []
		for i in 0..num1.length-1
			result *= num1[i]
		end
		return result
	end
	return num1*num2
end

def power(num1, num2)
	num1^num2
end

def factorial(num)
	result = 1
	for i in 1..num
		result = i * result
	end
end