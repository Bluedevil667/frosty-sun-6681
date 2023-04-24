Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete 'doctors/:id/patients/:patient_id', to: 'doctors#remove_patient', as: 'remove_patient_doctor'
  resources :doctors, only: [:show], as: :doctor
end
