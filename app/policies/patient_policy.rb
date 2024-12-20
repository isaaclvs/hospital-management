class PatientPolicy < ApplicationJob
  attr_reader :user, :patient

  def initialize(user, patient)
    @user = user
    @patient = patient
  end

  def new?
    user.role == "receptionist"
  end

  def index?
    user.role == "receptionist"
  end

  def edit?
    user.role == "receptionist"
  end

  def show?
    user.role == "receptionist"
  end

  def create?
    new?
  end

  def update?
    user.role == "receptionist"
  end

  def destroy?
    user.role == "receptionist"
  end
end
