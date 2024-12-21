class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_patient, only: [ :new, :create, :update, :destroy ]

  def index
    @patients = Patient.all
    authorize @patients
  end

  def new
    @patient = Patient.new
    authorize @patient
  end

  def create
    @patient = Patient.new(patient_params)
    authorize @patient

    if @patient.save
      redirect_to patients_url, notice: "Patient was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @patient = Patient.find(params[:id])
    authorize @patient

    if @patient.update(patient_params)
      redirect_to patients_path, notice: "Patient was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    authorize @patient

    @patient.destroy
    redirect_to patients_path, notice: "Patient was successfully deleted."
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :phone, :date_of_birth)
  end

  def authorize_patient
    authorize Patient
  end
end
