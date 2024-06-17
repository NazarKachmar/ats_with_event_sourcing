# frozen_string_literal: true

FactoryBot.define do
  factory :job_event, class: 'Job::Event' do
    association :job

    factory :job_activated_event, class: 'Job::Event::Activated', parent: :job_event

    factory :job_deactivated_event, class: 'Job::Event::Deactivated', parent: :job_event
  end
end
