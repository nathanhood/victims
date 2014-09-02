class StudentController < ApplicationController

  def index
    @student = Student.new
  end

  def create
  end
end
