# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Job, type: :model do
  it { is_expected.to have_many(:applications).dependent(:restrict_with_error) }
  it { is_expected.to have_many(:events).dependent(:destroy) }

  describe '#status' do
    let!(:job) { create(:job) }
    let!(:job_activated_event) { create(:job_activated_event, job:) }

    it 'returns the status of the last event' do
      expect(job.status).to eq('activated')
    end
  end

  describe '#applications associations' do
    let!(:job) { create(:job) }
    let!(:application1) { create(:application, job:) }
    let!(:application2) { create(:application, job:) }

    it 'has many applications' do
      expect(job.applications).to include(application1, application2)
    end
  end
end
