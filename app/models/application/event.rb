# frozen_string_literal: true

class Application
  class Event < ApplicationRecord
    APPLIED_STATUS   = 'applied'
    INTERVIEW_STATUS = 'interview'
    HIRED_STATUS     = 'hired'
    REJECTED_STATUS  = 'rejected'

    belongs_to :application

    scope :notes, -> { where(type: 'Application::Event::Note') }
    scope :without_notes, -> { where.not(type: 'Application::Event::Note') }
    scope :interviews, -> { where(type: 'Application::Event::Interview') }

    def status
      raise NotImplementedError
    end

    class Applied < Event
      def status
        APPLIED_STATUS
      end
    end

    class Interview < Event
      mysql_json_accessor :data, interview_date: :datetime

      def status
        INTERVIEW_STATUS
      end
    end

    class Note < Event
      mysql_json_accessor :data, content: :string
    end

    class Hired < Event
      mysql_json_accessor :data, hired_at: :datetime

      def status
        HIRED_STATUS
      end
    end

    class Rejected < Event
      def status
        REJECTED_STATUS
      end
    end
  end
end
