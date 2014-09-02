class StudentsController < ApplicationController

  def index
    @student = Student.new
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "#{@student.name} was added"
    else
      flash.now[:alert] = "Student could not be added"
      render students_path
    end
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end
