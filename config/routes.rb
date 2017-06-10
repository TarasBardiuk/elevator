# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, skip: %i[sessions registrations]

  as :admin do
    get 'sign_in',     to: 'devise/sessions#new',     as: :new_admin_session
    post 'sign_in',    to: 'devise/sessions#create',  as: :admin_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_admin_session

    get 'admins/edit', to: 'devise/registrations#edit',
                       as: 'edit_admin_registration'
    patch 'admins',    to: 'devise/registrations#update',
                       as: 'admin_registration'
  end

  get   'edit_info',        to: 'static_pages#edit_info'
  patch 'update_info',      to: 'static_pages#update_info', as: :update_info
  root  'static_pages#home'
end
