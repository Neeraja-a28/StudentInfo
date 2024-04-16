class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
  	 @student = Student.find(params[:id])
  end

  def new
  	@student = Student.new
  end

  def create
  	@student = Student.new(student_params)
  	update_course_name(@student)
 
	if @student.save
      redirect_to @student
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    update_course_name(@student)

    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

   def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

private
  def student_params
  	params.require(:student).permit(:name, :marks, :college, :passed_out_year, :status, course_attributes: [:name])

  end

  def update_course_name(student)
  
    course_params = params[:student][:course_attributes]

  	if course_params.present?
   	  @course = Course.create(name: course_params[:name])
   	  @course.save
      student.course_id = @course.id
      Rails.logger.info "student course details: #{student.course_id}"

    # Update the course name for the student
     student.save!
    end

  end

end
