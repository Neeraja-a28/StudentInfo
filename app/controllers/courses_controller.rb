class CoursesController < ApplicationController
	def create_course(student)
		course = Course.create(name: params[:name])
		student.course_id = course.id
		student.save
	end
end