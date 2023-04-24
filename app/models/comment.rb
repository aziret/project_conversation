# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :content, presence: true

  has_one :project_history, as: :actionable
  has_one :project, through: :project_history
end
