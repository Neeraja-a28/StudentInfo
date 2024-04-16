class Student < ApplicationRecord
	before_save :capitalize_name
	before_save :set_status
	after_save :send_notification
	after_destroy :destroy_student
	belongs_to :course


	accepts_nested_attributes_for :course

	def capitalize_name
		self.name = name.capitalize
	end

	def set_status
    	self.status = marks < 500 ? 'Fail' : 'Pass'
	end

	def send_notification
	  Rails.logger.info("Student #{name} has been saved. Status: #{status}")
    end

    def destroy_student
     Rails.logger.info("Student #{name} has been sucessfully deleted: #{college}")
    end
end
