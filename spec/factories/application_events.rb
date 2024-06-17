# frozen_string_literal: true

FactoryBot.define do
  factory :application_event, class: 'Application::Event' do
    application
  end

  factory :application_interview_event, class: 'Application::Event::Interview', parent: :application_event do
    interview_date { DateTime.new(2024, 5, 5, 9) }
  end

  factory :application_hired_event, class: 'Application::Event::Hired', parent: :application_event do
    hired_at { DateTime.new(2024, 5, 10) }
  end

  factory :application_rejected_event, class: 'Application::Event::Rejected', parent: :application_event

  factory :application_note_event, class: 'Application::Event::Note', parent: :application_event do
    content { 'some note' }
  end
end
