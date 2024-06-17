# frozen_string_literal: true

class ApplicationsController < ApplicationController
  def index
    render json: Application.with_active_job
  end
end
