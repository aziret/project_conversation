# frozen_string_literal: true

class Status < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :project_histories, as: :actionable
  has_many :projects, through: :project_histories
end
