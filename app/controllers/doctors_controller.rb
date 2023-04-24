class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def remove_patient
    doctor = Doctor.find(params[:id])
    patient = Patient.find(params[:patient_id])
    doctor.patients.delete(patient)
    redirect_to doctor_path(doctor)
  end
end
