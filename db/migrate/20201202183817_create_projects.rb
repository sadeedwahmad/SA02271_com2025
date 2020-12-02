class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.text :description, default: ""
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
