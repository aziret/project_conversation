# frozen_string_literal: true

class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :project_histories
  has_many :comments, lambda {
                        where(project_histories: { actionable_type: 'Comment' })
                      }, through: :project_histories, source: :actionable, source_type: 'Comment'
  has_many :statuses, lambda {
                        where(project_histories: { actionable_type: 'Status' })
                      }, through: :project_histories, source: :actionable, source_type: 'Status'

  def most_recent_status
    statuses.order(created_at: :desc).limit(1).first&.name
  end
end
