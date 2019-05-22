class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [:show, :edit, :update]
  before_action :require_same_student, only: [:edit, :update]
  
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
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user != @student
      flash[:notice] = "You can only edit your own profile."
      redirect_to student_path(current_user)
    end
  end
end