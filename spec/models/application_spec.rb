# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do # rubocop:disable Metrics/BlockLength
  it { is_expected.to belong_to(:job) }
  it { is_expected.to have_many(:events).dependent(:destroy) }

  describe 'scopes' do
    let!(:job) { create(:job) }
    let!(:application) { create(:application, job:) }
    let!(:hired_event) { create(:application_hired_event, application:) }

    it 'returns hired applications' do
      expect(Application.hired).to include(application)
    end

    it 'returns active applications' do
      expect(Application.active).not_to include(application)
    end
  end

  describe '#last_interview_at' do
    let!(:job) { create(:job) }
    let!(:application) { create(:application, job:) }
    let!(:interview_event) { create(:application_interview_event, application:) }

    it 'returns the date of the last interview' do
      expect(application.last_interview_at).to eq(interview_event.interview_date)
    end
  end

  describe '#status' do
    let!(:job) { create(:job) }
    let!(:application) { create(:application, job:) }
    let!(:hired_event) { create(:application_hired_event, application:) }

    it 'returns the status of the last event' do
      expect(application.status).to eq('hired')
    end
  end

  describe '#notes_count' do
    let!(:job) { create(:job) }
    let!(:application) { create(:application, job:) }
    let!(:note_event) { create(:application_note_event, application:) }

    it 'returns the count of notes' do
      expect(application.notes_count).to eq(1)
    end
  end
end
