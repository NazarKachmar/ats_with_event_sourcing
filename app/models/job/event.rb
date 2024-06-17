# frozen_string_literal: true

class Job
  class Event < ApplicationRecord
    belongs_to :job

    ACTIVATED = 'activated'
    DEACTIVATED = 'deactivated'

    def status
      raise NotImplementedError
    end

    class Activated < Event
      def status
        ACTIVATED
      end
    end

    class Deactivated < Event
      def status
        DEACTIVATED
      end
    end
  end
end
