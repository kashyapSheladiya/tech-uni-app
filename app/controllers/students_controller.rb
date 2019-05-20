class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(students_params)
    if @student.save
      flash[:notice] = "You have successfully signed up."
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(students_params)
      flash[:notice] = "Successfully Updated"
      redirect_to @student
    else
      render 'edit'
    end
  end

  private

  def students_params
    params.require(:student).permit(:name, :email)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end