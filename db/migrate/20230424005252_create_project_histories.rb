class CreateProjectHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :project_histories do |t|
      t.references :actionable, polymorphic: true, null: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
