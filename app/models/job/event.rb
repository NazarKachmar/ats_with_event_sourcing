# frozen_string_literal: true

class Job
  class Event < ApplicationRecord
    belongs_to :job
  end
end
