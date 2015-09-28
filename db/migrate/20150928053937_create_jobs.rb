class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :url
      t.string :ref_id
      t.string :title
      t.string :location
      t.string :category
      t.belongs_to :ticket, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
