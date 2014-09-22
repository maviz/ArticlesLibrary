class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.text :bio
      t.string :color
      t.string :twitter
      t.date :burthday

      t.timestamps
    end
  end
end
