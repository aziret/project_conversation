# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
include FactoryBot::Syntax::Methods

['open', 'in progress', 'done', 'to do', 'under review', 'approved', 'cancelled'].each do |status_name|
  Status.create(name: status_name) if Status.where(name: status_name).blank?
end

5.times do
  create(:project)
end

statuses = Status.all

Project.all.each do |project|
  statuses.each do |status|
    project.project_histories.create(actionable: status)
    comment = create(:comment)
    project.project_histories.create(actionable: comment)
  end
end
