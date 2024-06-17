# frozen_string_literal: true

FactoryBot.define do
  factory :application do
    association :job
    user_name { 'User Name' }
  end
end
