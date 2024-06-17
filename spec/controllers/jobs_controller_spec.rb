# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe 'GET #index' do
    let!(:job) { create(:job) }
    let!(:job_activated_event) { create(:job_activated_event, job:) }
    let!(:application) { create(:application, job:) }
    let!(:application_event) { create(:application_hired_event, application:) }

    before do
      get :index
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct JSON' do
      json_response = JSON.parse(response.body)
      expect(json_response.first['id']).to eq(job.id)
    end

    it 'includes the job title in the JSON response' do
      json_response = JSON.parse(response.body)
      expect(json_response.first['title']).to eq(job.title)
    end
  end
end
