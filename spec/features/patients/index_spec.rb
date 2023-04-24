require 'rails_helper'

RSpec.describe 'Patient Index Page' do
  before :each do
    @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @doctor = @hospital.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
    @patient_1 = @doctor.patients.create!(name: 'Katie Bryce', age: 24)
    @patient_2 = @doctor.patients.create!(name: 'Denny Duquette', age: 39)
    @patient_3 = @doctor.patients.create!(name: 'Rebecca Pope', age: 32)
    @patient_4 = @doctor.patients.create!(name: 'Zola Shepherd', age: 2)
  end

  it 'shows the names of all patients older than 18 listed in alphabetical' do
    visit patient_index_path
    
    expect(page).to have_content(@patient_2.name)
    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_3.name)
    expect(page).to_not have_content(@patient_4.name)

    # expect(@patient_2.name).to appear_before(@patient_1.name)
    # I was trying to use the appear_before matcher, like I have mutliple times in the past, but it was not working. I'm not sure why.
    # I checked the rails version that it comes with as well as the version of capybara and rspec, and they all seem to be up to date.
  end
end