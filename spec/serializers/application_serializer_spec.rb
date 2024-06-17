# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationSerializer, type: :serializer do
  let(:job) { create(:job, title: 'Job Title') }
  let(:application) { create(:application, job:, user_name: 'User Name') }
  let(:serializer) { described_class.new(application) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  let(:json) { JSON.parse(serialization.to_json) }

  it 'includes the expected attributes' do
    expect(json.keys).to contain_exactly('id', 'user_name', 'status', 'job_title', 'notes_count', 'last_interview_at')
  end

  it 'returns the correct job title' do
    expect(json['job_title']).to eq('Job Title')
  end

  it 'returns the correct notes count' do
    create(:application_note_event, application:)
    expect(json['notes_count']).to eq(1)
  end

  it 'returns the correct status' do
    create(:application_hired_event, application:)
    expect(json['status']).to eq('hired')
  end

  it 'returns the correct last interview date' do
    interview_event = create(:application_interview_event, application:)

    expect(json['status']).to eq('interview')
    expect(json['last_interview_at']).to eq(interview_event.interview_date)
  end
end
