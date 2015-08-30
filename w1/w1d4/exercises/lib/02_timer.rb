class Timer
	attr_reader :seconds
	attr_reader :time_string
	def initialize
		@seconds = 0
	end
	def seconds=(value=0)
		hours, minutes, seconds = 0, 0, 0
		seconds = value % 60
		if value >= 3600
			hours = value/3600
			minutes = value/60 % 60
		else
			hours = 0
			minutes = value/60
		end
		@time_string = "%02d:%02d:%02d" % [hours, minutes, seconds]
	end
end