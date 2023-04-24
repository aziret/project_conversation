class ProjectHistory < ApplicationRecord
  belongs_to :actionable, polymorphic: true
  belongs_to :project
end
