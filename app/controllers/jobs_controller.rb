# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    render json: Job.all
  end
end
