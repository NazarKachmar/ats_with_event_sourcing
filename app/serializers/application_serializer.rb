# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :status, :job_title, :notes_count, :last_interview_at

  def job_title
    object.job.title
  end
end
