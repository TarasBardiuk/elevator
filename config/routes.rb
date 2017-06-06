# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, skip: [:sessions]

  as :admin do
    get 'sign_in', to: 'devise/sessions#new', as: :new_admin_session
    post 'sign_in', to: 'devise/sessions#create', as: :admin_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_admin_session
  end

  root 'static_pages#home'
end
