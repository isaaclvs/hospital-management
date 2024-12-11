class ReceptionistController < ApplicationController
  before_action :authenticate_user!
  before_action :check_receptionist_role

  def dashboard
  end

  private

  def check_receptionist_role
    unless current_user.receptionist?
      redirect_to root_path, alert: "Access restricted to receptionist."
    end
  end
end

