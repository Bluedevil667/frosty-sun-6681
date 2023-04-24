class PatientsController < ApplicationController
  def index
    @adult_patients = Patient.where('age > ?', 18).order(name: :asc)
  end
end