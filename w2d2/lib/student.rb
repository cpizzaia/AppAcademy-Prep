class Student
	attr_reader :first_name, :last_name, :name, :courses
	def initialize(first_name, last_name)
		@first_name = first_name
		@last_name = last_name
		@name = "#{@first_name} #{@last_name}"
		@courses = []
	end
	def enroll(course)
		for i in 0..self.courses.length-1
				raise "Courses conflict" if course.conflicts_wth?(self.courses[i])
		end

		if !@courses.include? course
		    self.courses << course
		    course.students << self
		end
 	end
 	def course_load
 		result = Hash.new(0)
 		for i in 0..@courses.length-1
 			result[@courses[i].department] += @courses[i].credits
 		end
 		result
 	end
end
