class XmlDocument
  def initialize(indent=false)
		@indent = indent
		@space = -1
		@iteration = 0
		if @indent
			@n = "\n"
		else
			@n = ""
		end
	end
	def method_missing(method, input={})
		@indent == true ? @space += 1 : @space = 0
		if block_given?
			result = "#{'  '*@space}<#{method}>#{@n}#{yield}#{'  '*@space}</#{method}>#{@n}"
		elsif input == {}
			result = "#{'  '*@space}<#{method}/>#{@n}"
		else
			input.each {|key, value| result = "#{'  '*@space}<#{method} #{key}=\"#{value}\"/>#{@n}"}
		end
		@indent == true ? @space -= 1 : @space = 0
		@iteration = 1
		result
	end
	def send(name="")
		"<#{name}/>"
	end
end
