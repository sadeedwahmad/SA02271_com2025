class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :deadline
      t.date :setdate
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
