# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hospital1 = Hospital.create(name: "Hospital 1")
hospital2 = Hospital.create(name: "Hospital 2")
hospital3 = Hospital.create(name: "Hospital 3")

doctor1 = Doctor.create(name: "Doctor 1", specialty: "Specialty 1", university: "University 1", hospital_id: hospital1.id)
doctor2 = Doctor.create(name: "Doctor 2", specialty: "Specialty 2", university: "University 2", hospital_id: hospital2.id)
doctor3 = Doctor.create(name: "Doctor 3", specialty: "Specialty 3", university: "University 3", hospital_id: hospital3.id)

patient1 = Patient.create(name: "Patient 1", age: 1)
patient2 = Patient.create(name: "Patient 2", age: 2)
patient3 = Patient.create(name: "Patient 3", age: 3)
patient4 = Patient.create(name: "Patient 4", age: 4)
patient5 = Patient.create(name: "Patient 5", age: 5)
patient6 = Patient.create(name: "Patient 6", age: 6)

appointment1 = Appointment.create(doctor_id: doctor1.id, patient_id: patient1.id)
appointment2 = Appointment.create(doctor_id: doctor1.id, patient_id: patient2.id)
appointment3 = Appointment.create(doctor_id: doctor2.id, patient_id: patient3.id)
appointment4 = Appointment.create(doctor_id: doctor2.id, patient_id: patient4.id)
appointment5 = Appointment.create(doctor_id: doctor3.id, patient_id: patient5.id)
appointment6 = Appointment.create(doctor_id: doctor3.id, patient_id: patient6.id)