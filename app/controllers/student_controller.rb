class StudentController < ApplicationController

  def index
    @student = Student.create()
  end
end
