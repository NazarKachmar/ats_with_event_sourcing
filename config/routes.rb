# frozen_string_literal: true

Rails.application.routes.draw do
  resources :applications, only: :index
  resources :jobs, only: :index
end
