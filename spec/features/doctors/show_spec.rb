require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  before :each do
    @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @doctor = @hospital.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
    @doctor_2 = @hospital.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
    @patient_1 = @doctor.patients.create!(name: 'Katie Bryce', age: 24)
    @patient_2 = @doctor.patients.create!(name: 'Denny Duquette', age: 39)
    @patient_3 = @doctor.patients.create!(name: 'Rebecca Pope', age: 32)
    @patient_4 = @doctor.patients.create!(name: 'Zola Shepherd', age: 2)
    
    @appointment_1 = Appointment.create!(doctor_id: @doctor_2.id, patient_id: @patient_1.id)
  end

  it 'shows the doctor and their attributes' do
    visit doctor_path(@doctor)
    
    expect(page).to have_content(@doctor.name)
    expect(page).to have_content(@doctor.specialty)
    expect(page).to have_content(@doctor.university)
  end

  it 'shows the name of the hospital where the doctor works' do
    visit doctor_path(@doctor)

    expect(page).to have_content(@hospital.name)
  end

  it 'shows the names of all patients this doctor has' do
    visit doctor_path(@doctor)

    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)
    expect(page).to have_content(@patient_3.name)
    expect(page).to have_content(@patient_4.name)
  end

  it 'has a button next to each patient to remove them from the doctor' do
    visit doctor_path(@doctor)

    expect(page).to have_button('Remove Patient')
  end

  it 'removes the patient from the doctor when the button is clicked' do
    visit doctor_path(@doctor)

    within "#patient-#{@patient_1.id}" do
      click_button 'Remove Patient'
    end

    expect(current_path).to eq(doctor_path(@doctor))
    expect(page).to_not have_content(@patient_1.name)
  end

  it 'other doctors still have a patient that was removed from another doctors show page' do
    visit doctor_path(@doctor)

    within "#patient-#{@patient_1.id}" do
      click_button 'Remove Patient'
    end

    expect(current_path).to eq(doctor_path(@doctor))
    expect(page).to_not have_content(@patient_1.name)
    
    visit doctor_path(@doctor_2)
    
    expect(page).to have_content(@patient_1.name)
  end
end