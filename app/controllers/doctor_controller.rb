class DoctorController < ApplicationController
  before_action :authenticate_user!
  before_action :check_doctor_role

  def dashboard
  end

  private

  def check_doctor_role
    unless current_user.doctor?
      redirect_to root_path, alert: "Access restricted to doctors."
    end
  end
end
