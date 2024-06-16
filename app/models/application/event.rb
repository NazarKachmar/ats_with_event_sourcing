# frozen_string_literal: true

class Application
  class Event < ApplicationRecord
    belongs_to :application
  end
end
