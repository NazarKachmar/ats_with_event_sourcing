# frozen_string_literal: true

class Job < ApplicationRecord
  has_many :applications, dependent: :restrict_with_error
  has_many :events, dependent: :destroy

  def status
    events.last&.status
  end
end
