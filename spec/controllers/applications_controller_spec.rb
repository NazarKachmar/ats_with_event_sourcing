# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  describe 'GET #index' do
    let!(:job) { create(:job) }
    let!(:application1) { create(:application, job:) }
    let!(:application2) { create(:application, job:) }
    let!(:job_activated_event) { create(:job_activated_event, job:) }

    before do
      allow(Application).to receive(:with_active_job).and_return([application1, application2])
      get :index
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct JSON' do
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(2)
      expect(json_response.first['id']).to eq(application1.id)
    end
  end
end
