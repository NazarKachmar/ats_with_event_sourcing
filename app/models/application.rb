# frozen_string_literal: true

class Application < ApplicationRecord
  belongs_to :job

  has_many :events, dependent: :destroy

  scope :hired, -> { joins(:events).where('application_events.type': Application::Event::Hired.name) }
  scope :rejected, -> { joins(:events).where('application_events.type': Application::Event::Rejected.name) }
  scope :active, lambda {
    where.not(
      id: Application::Event.where(
        type: [Application::Event::Hired.name, Application::Event::Rejected.name]
      ).pluck(:application_id)
    )
  }
  scope :with_active_job, lambda {
    joins(job: :events).joins("INNER JOIN (
                                 SELECT job_id, MAX(created_at) AS last_event_time
                                 FROM job_events
                                 GROUP BY job_id
                               ) last_events ON job_events.job_id = last_events.job_id
                                 AND job_events.created_at = last_events.last_event_time")
                       .where(job_events: { type: 'Job::Event::Activated' })
                       .distinct
  }

  def last_interview_at
    events.interviews.last&.interview_date
  end

  def notes_count
    events.notes.count
  end

  def status
    events.without_notes.last&.status || Application::Event::APPLIED_STATUS
  end
end
