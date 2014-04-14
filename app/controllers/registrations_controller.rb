class RegistrationsController < ApplicationController
  def new
    @student_ambassador = StudentAmbassador.new
  end

  def create
    @student_ambassador = StudentAmbassador.new student_ambassador_params
    
    respond_to do |format|
      if @student_ambassador.save
        format.html { render :show }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def student_ambassador_params
    params.require(:student_ambassador).permit(:first_name, :last_name, :email, :phone_number, :frc_team_number)
  end
end
