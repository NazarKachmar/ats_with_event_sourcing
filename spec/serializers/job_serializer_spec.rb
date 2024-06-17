# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobSerializer, type: :serializer do # rubocop:disable Metrics/BlockLength
  let(:job) { create(:job, title: 'Job Title', description: 'Job Description') }
  let(:serializer) { described_class.new(job) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  let(:json) { JSON.parse(serialization.to_json) }

  it 'includes the expected attributes' do
    expect(json.keys).to contain_exactly('id', 'title', 'description', 'status', 'hired_users_count',
                                         'rejected_users_count', 'ongoing_users_count')
  end

  it 'returns the correct job title' do
    expect(json['title']).to eq('Job Title')
  end

  it 'returns the correct job description' do
    expect(json['description']).to eq('Job Description')
  end

  it 'returns the correct status' do
    create(:job_activated_event, job:)
    expect(json['status']).to eq('activated')
  end

  it 'returns the correct hired users count' do
    create(:application, job:)
    create(:application_hired_event, application: job.applications.first)
    expect(json['hired_users_count']).to eq(1)
  end

  it 'returns the correct rejected users count' do
    create(:application, job:)
    create(:application_rejected_event, application: job.applications.first)
    expect(json['rejected_users_count']).to eq(1)
  end

  it 'returns the correct ongoing users count' do
    create(:application, job:)
    expect(json['ongoing_users_count']).to eq(1)
  end
end
