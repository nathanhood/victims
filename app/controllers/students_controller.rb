class StudentsController < ApplicationController

  def index
    @student = Student.new
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "#{@student.name} has been added as a student!"
    else
      flash.now[:alert] = "Student could not be added"
      render "students/index"
    end
  end

  def victimize
    vic = Student.pick_victim
    if vic
      if vic.save
        redirect_to students_path, notice: "#{vic.name} has been victimized"
      else
        flash.now[:alert] = "Something went wrong"
        render "students/index"
      end
    else
      redirect_to students_path, notice: "- No students to victimize"
    end
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end
