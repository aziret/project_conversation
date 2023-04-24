FactoryBot.define do
  factory :project_history do
    actionable { create(:comment) }
    project { create(:project) }
  end
end
