require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :appointments}
  it {should have_many(:doctors).through(:appointments)}

  describe 'class methods' do
    describe '.adult_patients_in_alphabetical_order' do
      it 'returns all patients over 18 in alphabetical order' do
        patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
        patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
        patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
        patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)

        expect(Patient.adult_patients_in_alphabetical_order).to eq([patient_2, patient_1, patient_3, ])
      end
    end
  end
end