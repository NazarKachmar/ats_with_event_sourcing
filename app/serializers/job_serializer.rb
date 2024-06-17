# frozen_string_literal: true

class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :hired_users_count,
             :rejected_users_count, :ongoing_users_count

  def hired_users_count
    object.applications.hired.count
  end

  def rejected_users_count
    object.applications.rejected.count
  end

  def ongoing_users_count
    object.applications.active.count
  end
end
