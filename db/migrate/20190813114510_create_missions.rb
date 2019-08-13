class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :title
      t.string :category
      t.text :description
      t.integer :reward
      t.string :place
      t.datetime :start_date
      t.datetime :end_date
      t.integer :number_of_participants
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
