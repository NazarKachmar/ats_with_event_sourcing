# frozen_string_literal: true

class Job < ApplicationRecord
  has_many :events, dependent: :destroy
end
